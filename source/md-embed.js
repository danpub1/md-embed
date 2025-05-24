var qrcodes = []
var documentRendered = false
var qrcodesRequested = 0

function setQrcodes() {
    if (qrcodesRequested === 0 && documentRendered) {
        qrcodes.forEach((value, index, array) => {
            document.getElementById('qrcode' + index).innerHTML = value;
        });

        qrcodes = [];
    }
}

function onBodyLoad() {
    var renderer = new marked.Renderer();
    renderer.code = function (token) {
        if (token.lang === 'mermaid') {
            return '<div class="mermaid">' + token.text + '</div>';
        }

        if (token.lang === 'qrcode' || (token.lang && token.lang.startsWith('qrcode-'))) {
            qrcodesRequested++
            let thisQrcode = qrcodes.push('') - 1;
            QRCode.toString(token.text, { type: 'svg' }).then(s => {
                qrcodes[thisQrcode] = s
                qrcodesRequested--;
                setQrcodes();
            });
            var divClass = token.lang === 'qrcode' ? 'qrcode' : 'qrcode md-embed md-embed-' + token.lang.substring('qrcode-'.length)
            return '<div class="' + divClass + '" id="qrcode' + thisQrcode + '"></div>'
        }

        try {
            if (token.lang && hljs && hljs.getLanguage(token.lang)) {
                return '<pre><code class="language-' + token.lang + ' hljs">' + hljs.highlight(token.text, { "language": token.lang }).value + '</code></pre>'
            } else if (token.lang) {
                return '<pre><code class="language-' + token.lang + '">' + token.text + '</code></pre>'
            } else {
                return '<pre><code>' + token.text + '</code></pre>'
            }
        } catch (error) {
            if (token.lang) {
                return '<pre><code class="language-' + token.lang + '">' + token.text + '</code></pre>'
            } else {
                return '<pre><code>' + token.text + '</code></pre>'
            }
        }
    };

    marked.setOptions({
        gfm: true
    });

    marked.use({ renderer });

    var sanitizeConfig = {
        USE_PROFILES: { html: true, svg: true, svgFilters: true },
        ADD_TAGS: ['foreignObject']
    }
    document.getElementById('content').innerHTML = DOMPurify.sanitize(marked.parse(document.getElementById('markdown').innerHTML), sanitizeConfig);
    documentRendered = true;
    setQrcodes();

    document.getElementById('marked.js').remove();
    document.getElementById('mermaid.js').remove();
    document.getElementById('purify.js').remove();
    document.getElementById('highlight.js').remove();
    document.getElementById('qrcode.js').remove();
    document.getElementById('md-embed.js').remove();
    document.getElementById('markdown').remove();
    document.body.removeAttribute("onload");
}
