programa {
  funcao inicio() {
    
  }
}
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedido Especial ❤</title>
    <style>
        body {
            text-align: center;
            background-color: black;
            color: white;
            font-family: Arial, sans-serif;
            overflow: hidden;
        }
        .container {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        button {
            padding: 10px 20px;
            font-size: 18px;
            border: none;
            background: red;
            color: white;
            cursor: pointer;
            border-radius: 10px;
        }
        canvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        #pedido {
            display: none;
            font-size: 24px;
            margin-top: 20px;
        }
        .spotify {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <canvas id="background"></canvas>
    <div class="container" id="inicio">
        <button onclick="iniciarAnimacao()">Clique para começar ❤</button>
    </div>
    <div class="container" id="conteudo" style="display: none;">
        <canvas id="heartCanvas"></canvas>
        <button onclick="mostrarPedido()">Clique para revelar algo especial</button>
        <div id="pedido">Querida sarah, quer namorar comigo? ❤</div>
        <div class="spotify">
            <iframe style="border-radius:12px" src="https://open.spotify.com/embed/track/4iOeYpD6uxKmxU99NHSOi4?utm_source=generator" width="300" height="80" frameborder="0" allowfullscreen allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture"></iframe>
        </div>
    </div>
    
    <script>
        function iniciarAnimacao() {
            document.getElementById("inicio").style.display = "none";
            document.getElementById("conteudo").style.display = "block";
            iniciarCoracoes();
            animarCoracao();
        }
        
        function mostrarPedido() {
            document.getElementById("pedido").style.display = "block";
        }

        function iniciarCoracoes() {
            const canvas = document.getElementById("background");
            const ctx = canvas.getContext("2d");
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            
            let coracoes = [];
            for (let i = 0; i < 20; i++) {
                coracoes.push({
                    x: Math.random() * canvas.width,
                    y: Math.random() * canvas.height,
                    size: Math.random() * 30 + 10,
                    speed: Math.random() * 2 + 1
                });
            }
            
            function desenharCoracoes() {
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                ctx.fillStyle = "rgba(255, 0, 0, 0.3)";
                coracoes.forEach(c => {
                    ctx.beginPath();
                    ctx.arc(c.x, c.y, c.size, 0, Math.PI * 2);
                    ctx.fill();
                    c.y -= c.speed;
                    if (c.y < -10) c.y = canvas.height + 10;
                });
                requestAnimationFrame(desenharCoracoes);
            }
            desenharCoracoes();
        }
        
        function animarCoracao() {
            const canvas = document.getElementById("heartCanvas");
            const ctx = canvas.getContext("2d");
            canvas.width = 300;
            canvas.height = 300;
            let time = 0;
            
            function loop() {
                let n = -Math.cos(time);
                let size = (1 + n) * 50;
                time += ((Math.sin(time)) < 0 ? 9 : (n > 0.8) ? 0.2 : 1) * 0.02;
                ctx.clearRect(0, 0, canvas.width, canvas.height);
                
                ctx.fillStyle = "red";
                ctx.beginPath();
                ctx.moveTo(150, 200);
                ctx.bezierCurveTo(100, 100, 50, 50, 150, 30);
                ctx.bezierCurveTo(250, 50, 200, 100, 150, 200);
                ctx.fill();
                
                ctx.strokeStyle = "black";
                ctx.lineWidth = 2;
                ctx.stroke();
                
                requestAnimationFrame(loop);
            }
            loop();
        }
    </script>
</body>
</html>