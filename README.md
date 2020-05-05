# ListMagic
Get every word from root domain and make your own targeted subdomain wordlist. Works with amass to enumerate subdomains, then grabs every word before the dot as far as to a 5th level subdomain.

## Couple know-before's:
- Make sure you have amass installed!
- Kinda buggy still, might contain simple bugs, will commit as soon as a bug is identified.
- Kinda fast? Depends on the target.
- You can CTRL + C on your terminal when amass is taking too long, it will simply skip amass and generate the wordlist.

### USAGE: bash listmagic.sh <DOMAIN/DOMAINLIST.TXT>

#### INSTALL: wget https://raw.githubusercontent.com/weston2337/ListMagic/master/listmagic/listmagic.sh
#### INSTALL 2: git clone https://github.com/weston2337/ListMagic.git
