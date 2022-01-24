import requests

auth = 'your_email', 'your_password'
view_tickets = []
view_id = your_view_id

print(f'Getting tickets from view ID {view_id}')
url = f'https://your_subdomain.zendesk.com/api/v2/views/{view_id}/product.json'
while url:
   response = requests.get(url, auth=auth)
   page_data = response.json()
   tickets = page_data['tickets'] 
   view_tickets.extend(tickets)
   url = page_data['next_page']
