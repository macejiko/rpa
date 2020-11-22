# RPA Amazon Bot

> Results of search are not equal to provided item's name. Amazon search algorithm returns not always the thing that you are looking for :)

Bot execution steps:
- Open provided Excel file
- Go search on Amazon for particular item
- Sort Low -> High for price on search results page
- Take first available item with price
- Create new Excel file **result.xslx**
- Send **result.xslx** to provided email

## Install Bot

```
python3 -m virtualenv venv
source venv/bin/activate
pip install rpaframework
```

## Run Bot

- User should have configured Gmail acccount
- Also **chromedriver** should be configured properly

`robot -v GMAIL_ACCOUNT:xxx@gmail.com -v GMAIL_PASSWORD:XXX -v RECIPIENT_ADDRESS:yyy@gmail.com bot/bot.robot`
