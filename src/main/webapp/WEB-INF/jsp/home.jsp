<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bike Rental System</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 flex flex-col min-h-screen font-sans antialiased text-gray-900">
    <!-- Navbar -->
    <nav class="bg-white shadow">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex">
                    <div class="flex-shrink-0 flex items-center">
                        <span class="text-2xl font-bold text-blue-600">PedalGo</span>
                    </div>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="/login" class="text-gray-600 hover:text-gray-900 font-medium px-3 py-2 rounded-md transition">Login</a>
                    <a href="/register" class="bg-blue-600 text-white hover:bg-blue-700 px-4 py-2 rounded-md font-medium transition shadow-sm">Sign Up</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <main class="flex-grow flex items-center justify-center p-6">
        <div class="max-w-3xl text-center">
            <h1 class="text-5xl font-extrabold text-gray-900 tracking-tight sm:text-6xl mb-6">
                Ride Sharing & Bike Rentals <span class="text-blue-600">Made Easy</span>
            </h1>
            <p class="mt-4 text-xl text-gray-500 mb-10 max-w-2xl mx-auto">
                Join our community to rent bikes on the go, or share your own! Seamless, eco-friendly transportation in your city.
            </p>
            <div class="flex justify-center space-x-4">
                <a href="/register" class="bg-blue-600 border border-transparent text-white px-8 py-3 text-lg font-medium rounded-lg hover:bg-blue-700 transition shadow-lg">Get Started</a>
                <a href="/login" class="bg-white border border-gray-300 text-gray-700 px-8 py-3 text-lg font-medium rounded-lg hover:bg-gray-50 transition shadow-sm">I already have an account</a>
            </div>
        </div>
    </main>

    <!-- Footer -->
    <footer class="bg-white py-6 border-t border-gray-200">
        <div class="max-w-7xl mx-auto px-4 text-center text-sm text-gray-500">
            &copy; 2026 Bike Rental Ride Sharing (SE1020 Project). All rights reserved.
        </div>
    </footer>
</body>
</html>
