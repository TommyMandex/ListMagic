# ListMagic
Get every word from a domain and make your own targeted subdomain wordlist. Works with amass to enumerate subdomains, then grabs every word before the dot as far as to a 5th level subdomain. Combine this tool with massdns, dnscan or anything of your choice!

## Couple know-before's (Please read to avoid misconceptions):
- You **need** amass, which can be installed with the "dep.sh" file.
- Fast, but it depends on the target.
- You can **CTRL + C** on your terminal when amass is taking too long, it will simply skip amass and generate the wordlist.
- You can supply a **domain list** and it will still generate a wordlist from the supplied list.
- The **results** folder is for all of the dumped info, the **DOMAIN_results** folder is what you wanna see when wordlist generation is done.
- It is **recommended** to use another subdomain in massdns or dnscan after wordlist has been generated, e.g. ./listmagic.sh admin.google.com - *later in dnscan/massdns* - bruteforce the support.google.com page.

## INSTALL

```
git clone https://github.com/weston2337/ListMagic.git

cd ListMagic

chmod +x dep.sh

chmod +x listmagic.sh

./dep.sh
```

## USAGE

```
./listmagic.sh <DOMAINLIST.TXT/DOMAIN.COM>
```

## COMMON WORKFLOW

1.
```
./listmagic.sh <DOMAINLIST.TXT/DOMAIN.COM>
```
2. Use generated wordlist dumped in "DOMAIN_results/results.txt" on massdns/dnscan for subdomain bruteforcing.
3. Get hidden subdomains that resolve, which may not even be available when doing a normal subdomain enumeration scan.

Enjoy hacking! :)
