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
  % if 'favicon' in config:
  <link rel="shortcut icon" href="${config.favicon}" />
  % endif
  % if 'touchicon' in config: 
  <link rel="apple-touch-icon" href="${config.touchicon}" sizes="120x120">
  % endif
</head>

<body>
  <a class="profilePicture">
    <img src="${config.avatar}" alt="Profile Picture">
  </a>
 
  <div class="userName">
    ${config.name}
    % if 'pronunciation' in config:
    <i class="fa-solid fa-volume-high pointer pronunciation" onclick="playsound()"></i>
    <audio id="audio" style="display:none" src="${config.pronunciation}" ></audio>
    <script>
      function playsound() {
          var audio = document.getElementById("audio");
          audio.play();
      }
    </script>
    % endif
  </div>
  % if 'pronouns' in config:
  <div class="pronouns">
    ${config.pronouns}
  </div>
  % endif
  <div class="description">
    ${config.description}
  </div>
  % for section in links:
    <div id="${section.title}" class="sectionTitle">
      ${section.title}
    </div>
    <div class="links">
      % for link in section.links:
        % if 'href' in link and 'copy' in link:
          <a class="link" href="${link.href}" target="_blank">
            <div class="tooltip hidden min">
              <i class="fa-solid fa-copy"></i>
            </div>
            <div class="inline-block">
              <i class="${link.icon}"></i> ${link.text}
              % if 'info' in link:
              <div class="info">${link.info}</div>
              % endif
            </div>
            <div class="tooltip min">
              <span class="" href="#" onclick="copytext('${link.copy}','${link._id}')" onmouseout="outFunc('${link._id}')">
                <span class="tooltiptext-left" id="${link._id}">Copy to clipboard</span>
                <i class="fa-solid fa-copy"></i>
              </span>
            </div>
          </a>
        % elif 'href' in link:
        <a class="link" href="${link.href}" target="_blank">
          <i class="${link.icon}"></i> ${link.text}
          % if 'info' in link:
          <div class="info">${link.info}</div>
          % endif
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
