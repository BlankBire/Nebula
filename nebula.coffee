window.onload = ->
  canvas = document.getElementById "space"
  ctx = canvas.getContext "2d"
  canvas.width = window.innerWidth
  canvas.height = window.innerHeight

  particles = []
  num = 100

  for i in [0...num]
    particles.push
      x: Math.random() * canvas.width
      y: Math.random() * canvas.height
      r: Math.random() * 2 + 1
      dx: (Math.random() - 0.5) * 2
      dy: (Math.random() - 0.5) * 2

  animate = ->
    ctx.clearRect 0, 0, canvas.width, canvas.height
    for p in particles
      ctx.beginPath()
      ctx.arc p.x, p.y, p.r, 0, Math.PI * 2
      ctx.fillStyle = "rgba(255,255,255,0.8)"
      ctx.fill()
      p.x += p.dx
      p.y += p.dy
      if p.x < 0 or p.x > canvas.width then p.dx *= -1
      if p.y < 0 or p.y > canvas.height then p.dy *= -1
    requestAnimationFrame animate

  animate()
