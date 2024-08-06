<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us - LaptopEmporium</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style type="text/css">
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .header {
            background-color: #333;
            color: #fff;
            padding: 20px 0;
        }

        .header h1 {
            text-align: center;
            margin: 0;
        }

        .nav {
            text-align: center;
        }

        .nav a {
            color: #fff;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
        }

        .nav a:hover {
            text-decoration: underline;
        }

        .about-us, .our-mission, .what-we-offer, .why-choose-us {
            padding: 40px 0;
        }

        h2, h3, h4 {
            text-align: center;
        }

        .what-we-offer .grid, .why-choose-us .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }

        .what-we-offer .item, .why-choose-us .item {
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .contact-info {
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 15px;
            text-align: center;
            margin-left: 300px;
            margin-right: 300px;
            margin-bottom: 30px;
        }

        .contact-info h3 {
            margin: 0;
            font-weight: bold;
        }

        .contact-form {
            display: inline-block;
            text-align: left;
            max-width: 400px;
            
        }

        .contact-form label {
            display: block;
            margin-bottom: 3px;
        }

        .contact-form input,
        .contact-form textarea {
            padding: 8px;
            margin-bottom: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 100%;
        }

        .contact-form button {
            padding: 8px 16px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .contact-form button:hover {
            background-color: #555;
        }
        
        .contact-info h3{
        	margin-top: 3px;
        	margin-bottom: 6px;
        }
        .contact-info p{
        	margin-top: 3px;
        	margin-bottom: 10px;
        }

        
    </style>
</head>
<body>
    <div class="nav-container">
        <nav>
            <div class="circle"></div>
            <div class="nav-pages">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="about">About Us</a></li>
                </ul>
            </div>
        </nav>
    </div>

    <section class="about-us">
        <div class="container">
            <h2>About Us</h2>
            <p>Welcome to LaptopEmporium, your one-stop online destination for all things laptops!</p>
            <p>We are a team of tech enthusiasts, engineers, and customer service professionals dedicated to providing you with the best laptops, accessories, and related technology products on the market.</p>
        </div>
    </section>

    <section class="our-mission">
        <div class="container">
            <h3>Our Mission</h3>
            <p>Our mission is simple: to make technology accessible to everyone. We aim to bridge the gap between innovation and affordability, ensuring you get the best value for your money.</p>
        </div>
    </section>

    <section class="what-we-offer">
        <div class="container grid">
            <div class="item">
                <h4>Laptops</h4>
                <p>From high-performance gaming laptops to ultra-portable notebooks, we have a wide selection to meet every need and budget.</p>
            </div>
           
            <div class="item">
                <h4>Services</h4>
                <p>Our dedicated support team is here to help with any questions or concerns. We also offer repair services and extended warranties.</p>
            </div>
        </div>
    </section>

    <section class="why-choose-us">
        <div class="container">
            <h3>Why Choose LaptopEmporium?</h3>
            <div class="grid">
                <div class="item">
                    <h4>Quality Assurance</h4>
                    <p>We source our products from reputable manufacturers and perform rigorous quality checks to ensure high quality.</p>
                </div>
                <div class="item">
                    <h4>Competitive Pricing</h4>
                    <p>We work hard to keep our prices competitive without compromising on quality.</p>
                </div>
                <div class="item">
                    <h4>Customer-Centric</h4>
                    <p>Your satisfaction is our top priority. We have a 24/7 customer service team and a hassle-free return policy.</p>
                </div>
            </div>
        </div>
    </section>
    
    <div class="contact-info">
        <h3>Contact Us</h3>
        <p>Phone: <a href="tel:+977-9821102364">+977-9821102364</a></p>
        <p>Email: <a href="mailto:laptopemporium03@gmail.com">laptopemporium03@gmail.com</a></p>
        
        <div class="contact-form">
            <h4>Send us a message</h4>
            <form action="/contact" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="3" required></textarea>

                <button type="submit">Send Message</button>
            </form>
        </div>
    </div>

    <footer class="footer-container">
        <div class="social-icons">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
        <p>Kamal Pokhari, Behind City Center, Kathmandu 44600, Nepal</p>
        <div class="call-mail">
            <a href="tel:+977-123456789"><i class="fas fa-phone"></i> +977-123456789</a>
            <a href="mailto:example@example.com"><i class="fas fa-envelope"></i> example@example.com</a>
        </div>
    </footer>
</body>
</html>
