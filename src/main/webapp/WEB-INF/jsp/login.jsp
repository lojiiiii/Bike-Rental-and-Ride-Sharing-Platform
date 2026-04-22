<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - Bike Rental</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 rounded-xl shadow-xl w-full max-w-md border border-gray-200">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-extrabold text-gray-900">Welcome back</h2>
            <p class="text-gray-500 mt-2">Please enter your details to sign in.</p>
        </div>
        
        <form action="/login" method="POST" class="space-y-6">
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email address</label>
                <input type="email" id="email" name="email" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>
            
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input type="password" id="password" name="password" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>

            <div class="flex items-center justify-between">
                <div class="flex items-center">
                    <input id="remember-me" name="remember-me" type="checkbox" class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded">
                    <label for="remember-me" class="ml-2 block text-sm text-gray-900"> Remember me </label>
                </div>
            </div>

            <div>
                <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition">
                    Sign in
                </button>
            </div>
        </form>
        
        <div class="mt-6 text-center">
            <p class="text-sm text-gray-600">
                Don't have an account? 
                <a href="/register" class="font-medium text-blue-600 hover:text-blue-500 transition">Sign up now</a>
            </p>
        </div>
        <div class="mt-4 text-center">
            <a href="/" class="text-sm text-gray-500 hover:text-gray-800 transition">&larr; Back to home</a>
        </div>
    </div>
</body>
</html>
