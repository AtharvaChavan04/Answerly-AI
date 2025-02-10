
import asyncio
from fastapi import FastAPI, WebSocket
from pydantic_models.chat_body import ChatBody
from services.gemini_service import GeminiService
from services.sort_source_service import SortSourceService
from services.search_servies import SearchServices


app = FastAPI()

search_services = SearchServices()
sort_source_services = SortSourceService()
gemini_service = GeminiService()

#chat websocket
@app.websocket("/ws/chat")
async def websocket_chat_endpoint(websocket: WebSocket):
    await websocket.accept()

    try:
        await asyncio.sleep(0.1)
        data = await websocket.receive_json()
        query = data.get("query")

        search_results = search_services.web_search(query)
        sorted_results = sort_source_services.sort_sources(query, search_results)

        await asyncio.sleep(0.1)
        await websocket.send_json({
            'type': 'search_results',
            'data': sorted_results
        })

        # generate the response using Gemini 
        for chunk in gemini_service.generate_response(query, sorted_results):
            await asyncio.sleep(0.1)
            await websocket.send_json({"type": "content", "data": chunk})
    except:
        print("Unexpected Error Occured!")
    finally:
        await websocket.close()

#chat
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    # search on web and find sources
    search_results = search_services.web_search(body.query)

    # sort the sources(most relevant and least relevant sources)
    sorted_results = sort_source_services.sort_sources(body.query, search_results)

    # generate the response using Gemini 
    response = gemini_service.generate_response(body.query, sorted_results)

    return response