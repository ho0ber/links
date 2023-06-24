<!DOCTYPE html>
<html lang="en-US">

<head>
  <meta charset="UTF-8">
  % if 'robots' in config:
    <meta name='robots' content='${config.robots}' />
  % endif
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${config.title}</title>
  <link rel="stylesheet" href="style.css">
  <style>
    html {
        background:
          linear-gradient(
            rgba(0, 0, 0, ${config.background_opacity}),
            rgba(0, 0, 0, ${config.background_opacity})
          ),
          url('${config.background}'),
          rgba(0,0,0);
    }
  </style>
  <script src="https://kit.fontawesome.com/6bee25835f.js" crossorigin="anonymous"></script>
  <link rel="icon" href="${config.avatar}" type="image/x-icon" />
</head>

<body>
  <a class="profilePicture">
    <img src="${config.avatar}" alt="Profile Picture">
  </a>
 
  <div class="userName">
    ${config.name}
  </div>

  <div class="description">
    ${config.description}
  </div>
  % for section in links:
    <div class="sectionTitle">
      ${section.title}
    </div>
    <div class="links">
      % for link in section.links:
        % if 'href' in link and 'copy' in link:
          <a class="link" href="${link.href}" target="_blank">
            <div class="tooltip float-left hidden">
              <i class="fa-solid fa-copy"></i>
            </div>
            <i class="${link.icon}"></i> ${link.text}
            <div class="tooltip float-right">
              <span class="" href="#" onclick="copytext('${link.copy}','${link._id}')" onmouseout="outFunc('${link._id}')">
                <span class="tooltiptext-left" id="${link._id}">Copy to clipboard</span>
                <i class="fa-solid fa-copy"></i>
              </span>
            </div>
          </a>
        % elif 'href' in link:
        <a class="link" href="${link.href}" target="_blank">
          <i class="${link.icon}"></i> ${link.text}
        </a>
        % elif 'copy' in link:
        <div class="tooltip block">
        <a class="link" href="#" onclick="copytext('${link.copy}','${link._id}')" onmouseout="outFunc('${link._id}')">
          <span class="tooltiptext" id="${link._id}">Copy to clipboard</span>
          <i class="${link.icon}"></i> ${link.text}
        </a>
        </div>
        % endif
      % endfor
    </div>
  % endfor

  <footer>
    % if 'qrcode' in config:
    <div class="qrcode"><img src="${config.qrcode}" /></div>
    % endif
    <div class="footer">Last updated: ${metadata.last_updated}</div>
  </footer>

</body>
<script>
  function copytext(val, linkid) {
    event.preventDefault();
    console.log(val);
    navigator.clipboard.writeText(val);
    var tooltip = document.getElementById(linkid);
    tooltip.innerHTML = "Copied: " + val;
  }

  function outFunc(linkid) {
    var tooltip = document.getElementById(linkid);
    tooltip.innerHTML = "Copy to clipboard";
  }
</script>
</html>
