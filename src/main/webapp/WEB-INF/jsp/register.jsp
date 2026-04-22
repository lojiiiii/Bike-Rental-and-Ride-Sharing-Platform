<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register - Bike Rental</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen py-10">
    <div class="bg-white p-8 rounded-xl shadow-xl w-full max-w-md border border-gray-200">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-extrabold text-gray-900">Create an account</h2>
            <p class="text-gray-500 mt-2">Join us and start riding today.</p>
        </div>
        
        <form action="/users/create" method="POST" class="space-y-5">
            <div>
                <label for="name" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                <input type="text" id="name" name="name" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>

            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                <input type="email" id="email" name="email" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>
            
            <div>
                <label for="role" class="block text-sm font-medium text-gray-700 mb-1">Select Role</label>
                <select id="role" name="role" required class="mt-1 block w-full pl-3 pr-10 py-2 text-base border border-gray-300 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm rounded-md">
                    <option value="" disabled selected>Select a role...</option>
                    <option value="RIDER">Rider (Rent a bike)</option>
                    <option value="OWNER">Owner (List a bike)</option>
                </select>
            </div>
            
            <div>
                <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input type="password" id="password" name="password" required class="appearance-none block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm placeholder-gray-400 focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
            </div>

            <div class="pt-2">
                <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition">
                    Create Account
                </button>
            </div>
        </form>
        
        <div class="mt-6 text-center">
            <p class="text-sm text-gray-600">
                Already have an account? 
                <a href="/login" class="font-medium text-blue-600 hover:text-blue-500 transition">Log in</a>
            </p>
        </div>
        <div class="mt-4 text-center">
            <a href="/" class="text-sm text-gray-500 hover:text-gray-800 transition">&larr; Back to home</a>
        </div>
    </div>
</body>
</html>
