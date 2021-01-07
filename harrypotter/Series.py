from flask import Flask, render_template, request, jsonify

app = Flask(__name__)
import requests
from bs4 import BeautifulSoup

from pymongo import MongoClient

client = MongoClient('localhost', 27017)
db = client.dbsparta


@app.route('/')
def home():
    return render_template('Series.html')


# @app.route('/review', methods=['POST'])
# def write_review():
#     url_receive = request.form['url_give']
#     return jsonify({'result': 'success', 'msg': '완료'})


@app.route('/potter', methods=['GET'])
def read_movie():
    Movies = list(db.HarryPotter.find({}, {'_id': False}))
    for m in Movies:
        print(m)
    return jsonify({'Movie': Movies})


headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}
data = requests.get(
    'https://movie.naver.com/movie/bi/mi/basic.nhn?code=47528',
    headers=headers)

soup = BeautifulSoup(data.text, 'html.parser')

trs = soup.select('#content > div.article > div.mv_info_area',headers=headers)

for tr in trs:
    if tr is not None:
        title = tr.select_one('div.mv_info > h3 > a').text
        open = tr.select_one('div.mv_info > dl > dd:nth-child(2) > p > span:nth-child(4)').text
        direction = tr.select_one('div.mv_info > dl > dd:nth-child(4) > p > a').text
        image = tr.select_one('div.poster > a > img')['src']

        # db에 저장
        # doc = {
        #     'title': title,
        #     'image': image,
        #     'open': open,
        #     'direction': direction,
        #
        # }
        # db.HarryPotter.insert_one(doc)





# Movies = list(db.HarryPotter.find({}, {'_id': False}))


# headers = {
#     'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.86 Safari/537.36'}
# data = requests.get(
#     'https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&mra=bkEw&pkid=68&os=1768663&query=%EC%98%81%ED%99%94%20%ED%95%B4%EB%A6%AC%20%ED%8F%AC%ED%84%B0%EC%99%80%20%EB%A7%88%EB%B2%95%EC%82%AC%EC%9D%98%20%EB%8F%8C%20%EC%8B%9C%EB%A6%AC%EC%A6%88',
#     headers=headers)
#
# soup = BeautifulSoup(data.text, 'html.parser')
#
# trs = soup.select(
#     '#main_pack > div.sc_new.cs_common_module._au_movie_content_wrap > div.cm_content_wrap._cm_content_wrap_series > div > div > div > div',
#     headers=headers)
#
# for tr in trs:
#     if tr is not None:
#         title = tr.select_one('strong > span').text
#         open = tr.select_one('dl > dd:nth-child(2)').text
#         direction = tr.select_one('dl > dd:nth-child(4)').text
#         image = tr.select_one('div > a > img')['src']

# mongoDB에 데이터 넣기
# doc = {
#     'title': title,
#     'image': image,
#     'open': open,
#     'direction': direction,
#
# }
# db.HarryPotter.insert_one(doc)

if __name__ == '__main__':
    app.run('0.0.0.0', port=5000, debug=True)
