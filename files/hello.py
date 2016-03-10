def app(env, req):
    status = '200 OK'
    response_headers = [('Content-Type','text/plain')]
    req(status, response_headers)
    resp = environ['QUERY_STRING'].split("&")
    resp = [item+"\n" for item in resp]
    return resp
