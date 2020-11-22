*** Settings ***

Documentation  All Gmail Keywords

*** Keywords ***

Gmail Authorize
    Authorize Smtp  ${GMAIL_ACCOUNT}  ${GMAIL_PASSWORD}  smtp.gmail.com  587

Send Email
    [Arguments]  ${subject}  ${body}  ${attachments}
    Send Message  sender=${GMAIL_ACCOUNT}
    ...           recipients=${RECIPIENT_ADDRESS}
    ...           subject=${subject}
    ...           body=${body}
    ...           attachments=${attachments}
