# ListMagic
Get every word from root domain and make your own targeted subdomain wordlist. Works with amass + crt.sh to enumerate subdomains, then grabs every word before the dot as far as to a 5th level subdomain.

### Couple know-before's:
- Make sure you have amass installed!
- Supplying a domain list doesn't grab words as far up to a 5th level subdomain.
- May require cleaning up, requires for you to remove your supplied root domain from the wordlist afterwards. (I will implement a feature like this soon, I hope.)
- Kinda fast? Depends on the target.

Since it was 4 AM in the morning for me to upload this, I will continue on this in the next few days. For now, you need to stick with what I have now.

## USAGE: bash listmagic.sh <DOMAIN/DOMAINLIST.TXT>
