<!DOCTYPE html>
<html lang="en-US">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${config.title}</title>
  <link rel="stylesheet" href="style.css">
  <style>
    html {
        background: linear-gradient(
          rgba(0, 0, 0, ${config.background_opacity}),
          rgba(0, 0, 0, ${config.background_opacity})),
          url('${config.background}'
        );
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
        <a class="link" href="${link.href}" target="_blank">
          <i class="${link.icon}"></i> ${link.text}
        </a>
      % endfor
    </div>
  % endfor

</body>
 
</html>
