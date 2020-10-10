# UIsuru
import keywordExtractor
from googletrans import Translator
translator = Translator()

message = "මට දියවැඩියාව doctor කෙනෙක් හමුවීමට ඕන"

#translated Test
english = translator.translate(message)
english = english.text

#keyword Extractor
keyword_dictionary = keywordExtractor.getDict('test.csv')
keyword_processor = keywordExtractor.processor()
keyword_processor.add_keywords_from_dict(keyword_dictionary)


print(keyword_processor.extract_keywords(english))
print(keyword_processor.extract_keywords(message))



# =============================================================================
# import requests
# import pandas as pd
# import os
# from urllib.parse import urlparse
# 
# urls = pd.read_csv('links.csv')
# for url in urls:
#     a = urlparse(url)
#     print(os.path.basename(a.path))
#     # response = requests.get(url)
#     # if response.status_code == 200:
#     #     with open("images/sample.jpg", 'wb') as f:
#     #         f.write(response.content)
# 
# =============================================================================
