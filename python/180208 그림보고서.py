import urllib.parse
import urllib.request
import re

def bind_url(): #함수
    default_url="https://openapi.naver.com/v1/search/image.xml?" #기본 주소값을 할당해줌
    start="&start="+str(1)
    sort="sort="+"sim"
    display='&display=100'
    query='&query='+urllib.parse.quote_plus(str(input("검색어를 입력하세요:")))
    #입력을 받는데 한글로 그대로 받기위해서 urllib의 parse.quote_plus사용
    full_url=default_url+sort+start+display+query
    return full_url #결과값 full_url 넘겨줌
def fetch_contents_from_url():
    url=bind_url()#full_url값을 url에 저장
    headers={ #headers에 host,user-agent,accept,content-type,naver Id,Secret 를 담아줌
    'Host':'openapi.naver.com',
    'User-Agent':'curl/7.43.0',
    'Accept':'*/*',
    'Content-Type':'application/xml',
    'X-Naver-Client-Id':'Ar6_6NM9yjHEZavIC8wI',
    'X-Naver-Client-Secret':'IdLxxpyBJA'
    }
    r=urllib.request.Request(url,headers=headers) #r에 url,headers를 요청해주는 주소 문자열을 담음
    m=urllib.request.urlopen(r)#urlopen()=명령을 통해 html텍스트를 한 줄 씩 읽어들인다.
    html=m.read()#m을 읽어서 html에 넣어줌
    print(html)
    return html
def extract_text_in_tags(tags,tagname="title"):
    txt=[]
    reg="[^<"+tagname+">][^<]+"
    
    for tag in tags:
        txt.append(re.search(reg,tag).group())
    return txt
def get_contents_from_html():
    html=fetch_contents_from_url()
    title_tags=re.findall("<title>[^<]+</title>",html.decode('utf-8')) #title은 글자(제목) 저장,decode= 한글깨짐 방지
    link_tags=re.findall("<link>[^<]+</link>",html.decode('utf-8'))#link은 사진 저장
    titles=extract_text_in_tags(title_tags,tagname="title")
    links=extract_text_in_tags(link_tags,tagname="link")
    f=open("image.html","w",encoding="utf-8")
    f.write("<html><body>")
    for i in range(1,len(titles)): #파일 쓰기 
        f.write("<p>"+titles[i]+"</p>")
        f.write("<img src="+links[i]+"/>")
    f.write("</body></html>")
    f.close()#자원 닫기
get_contents_from_html()
                
