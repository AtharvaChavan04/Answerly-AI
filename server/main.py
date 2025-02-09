
from fastapi import FastAPI
from pydantic_models.chat_body import ChatBody
from services.sort_source_service import SortSourceService
from services.search_servies import SearchServices


app = FastAPI()

search_services = SearchServices()
sort_source_services = SortSourceService()

#chat
@app.post("/chat")
def chat_endpoint(body: ChatBody):
    # search on web and find sources
    search_results = search_services.web_search(body.query)

    # sort the sources(most relevant and least relevant sources)
    sorted_results = sort_source_services.sort_sources(body.query, search_results)
    print(sorted_results)
    # generate the response using Gemini 
    return body.query 