# UIsuru

import classify

print(classify.find("මේ මාසේ බිලට කීයක් දාන්න ඕනිද")) # default -> maxClass=2, reqPreScore=True
#{'billing': 0.80112785, 'ask_for_bill_amount': 0.67654777}

print(classify.find("මේ මාසේ බිලට කීයක් දාන්න ඕනිද",3))
#{'billing': 0.80112785, 'ask_for_bill_amount': 0.67654777, 'vas': 0.3089632}

print(classify.find("මේ මාසේ බිලට කීයක් දාන්න ඕනිද",2,False))
#{'ask_for_bill_amount', 'billing'}

print(classify.find("මේ මාසේ බිලට කීයක් දාන්න ඕනිද",4,False))
#{'vas', 'ask_for_bill_amount', 'billing', 'vas_activate_now'}