Message = n:Node* { return n.join('') }

Node = TagPair / URL / BodyChar

TagPair = r:(o:OTag r:RestOfPair {return Object.assign({otag:o},r)})
    	& { return r.otag == r.ctag}
        {return  '<'+r.otag+'>'+r.str+'</' + r.ctag + '>'}
RestOfPair = c:CTag {return {ctag:c,str:''}} / b:Node r:RestOfPair {return {ctag:r.ctag,str:b + r.str}}


/* URLS */
URL = s:URLScheme u:UrlInAttrChar+ {return '<a href="' + s + u.join('') +'">[url]</a>'}
URLScheme = 'http://' / 'https://' / 'ftp://'

/* TAGS */
OTag = '<' n:TagName '>' {return n}
CTag = '</' n:TagName '>' {return n}
TagName = [buis] / "tt"


/* CHARACTERS */
BodyChar      = BodyAllowedChar / ControlChar / Amp / LT / GT
UrlInAttrChar = UrlInAttrAllowedChar / ControlChar / Amp      / GT

ControlChar = [\0-\x1F\x7F] {return ' '}
Amp = '&' { return '&amp;' }
LT = '<' { return '&lt;' }
GT = '>' { return '&gt;' }
Quot = '"' { return '&quot;' }
BodyAllowedChar      = [^\0-\x1F\x7F<>&]
UrlInAttrAllowedChar = [^\0-\x1F\x7F<>&" ,[]
