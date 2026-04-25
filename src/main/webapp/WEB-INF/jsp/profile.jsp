<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - PedalGo</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .glass { background: rgba(255, 255, 255, 0.7); backdrop-filter: blur(10px); }
    </style>
</head>
<body class="bg-gray-50 min-h-screen">

    <!-- Top Navigation -->
    <nav class="sticky top-0 z-50 glass border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <a href="/dashboard" class="text-2xl font-extrabold text-blue-600 tracking-tight">PedalGo</a>
                    <div class="hidden md:ml-10 md:flex md:space-x-8">
                        <a href="/dashboard" class="border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium">Marketplace</a>
                        <a href="/profile" class="border-blue-500 text-gray-900 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium">Profile</a>
                    </div>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="/logout" class="text-sm font-semibold text-red-600 hover:text-red-700 transition">Sign Out</a>
                </div>
            </div>
        </div>
    </nav>

    <main class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-10">
        <!-- Profile Header -->
        <div class="bg-white rounded-3xl p-8 shadow-sm border border-gray-100 flex flex-col md:flex-row items-center mb-8">
            <div class="h-24 w-24 rounded-full bg-blue-600 flex items-center justify-center text-white text-4xl font-bold border-4 border-blue-50 shadow-inner mb-4 md:mb-0 md:mr-8">
                <c:out value="${fn:toUpperCase(fn:substring(user.name, 0, 1))}" />
            </div>
            <div class="text-center md:text-left flex-grow">
                <h1 class="text-3xl font-extrabold text-gray-900"><c:out value="${user.name}" /></h1>
                <p class="text-blue-600 font-semibold mb-2"><c:out value="${user.role}" /> • Member since 2026</p>
                <div class="flex items-center justify-center md:justify-start space-x-4">
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-bold bg-green-100 text-green-700">Verified Account</span>
                    <span class="text-sm text-gray-500 flex items-center">
                        <svg class="h-4 w-4 mr-1" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd" /></svg>
                        Berlin, Germany
                    </span>
                </div>
            </div>
            <div class="mt-6 md:mt-0">
                <button class="bg-blue-600 text-white px-6 py-2.5 rounded-xl font-bold shadow-lg hover:bg-blue-700 transition">Edit Profile</button>
            </div>
        </div>

        <!-- Stats Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-3 gap-6 mb-8">
            <div class="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 text-center hover:scale-105 transition-transform duration-300">
                <p class="text-sm text-gray-500 font-medium mb-1">Total Trips</p>
                <p class="text-3xl font-black text-gray-900">124</p>
            </div>
            <div class="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 text-center hover:scale-105 transition-transform duration-300">
                <p class="text-sm text-gray-500 font-medium mb-1">Distance (km)</p>
                <p class="text-3xl font-black text-gray-900">842.5</p>
            </div>
            <div class="bg-white p-6 rounded-3xl shadow-sm border border-gray-100 text-center hover:scale-105 transition-transform duration-300">
                <p class="text-sm text-gray-500 font-medium mb-1">Carbon Saved</p>
                <p class="text-3xl font-black text-green-600">12kg</p>
            </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Left Side: Info -->
            <div class="lg:col-span-2 space-y-8">
                <!-- Account Info -->
                <div class="bg-white rounded-3xl p-8 shadow-sm border border-gray-100">
                    <h2 class="text-xl font-bold text-gray-900 mb-6 flex items-center">
                        <svg class="h-6 w-6 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                        Account Details
                    </h2>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Full Name</label>
                            <p class="text-gray-900 font-medium"><c:out value="${user.name}" /></p>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Email Address</label>
                            <p class="text-gray-900 font-medium"><c:out value="${user.email}" /></p>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Phone Number</label>
                            <p class="text-gray-900 font-medium">+49 152 444 0000</p>
                        </div>
                        <div>
                            <label class="block text-xs font-bold text-gray-400 uppercase tracking-wider mb-1">Account Role</label>
                            <p class="text-gray-900 font-medium"><c:out value="${user.role}" /></p>
                        </div>
                    </div>
                </div>

                <!-- Recent Activity -->
                <div class="bg-white rounded-3xl p-8 shadow-sm border border-gray-100">
                    <h2 class="text-xl font-bold text-gray-900 mb-6 flex items-center">
                        <svg class="h-6 w-6 mr-2 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        Recent Activity
                    </h2>
                    <div class="space-y-6">
                        <div class="flex items-center justify-between pb-4 border-b border-gray-50 last:border-0 last:pb-0">
                            <div class="flex items-center">
                                <div class="bg-blue-50 p-3 rounded-2xl mr-4">
                                    <svg class="h-6 w-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
                                </div>
                                <div>
                                    <h4 class="font-bold text-gray-900">Rented VoltGlide X1</h4>
                                    <p class="text-sm text-gray-500">Yesterday at 2:15 PM</p>
                                </div>
                            </div>
                            <span class="font-bold text-gray-900">-$24.00</span>
                        </div>
                        <div class="flex items-center justify-between pb-4 border-b border-gray-50 last:border-0 last:pb-0">
                            <div class="flex items-center">
                                <div class="bg-green-50 p-3 rounded-2xl mr-4">
                                    <svg class="h-6 w-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                </div>
                                <div>
                                    <h4 class="font-bold text-gray-900">Wallet Topped Up</h4>
                                    <p class="text-sm text-gray-500">2 days ago</p>
                                </div>
                            </div>
                            <span class="font-bold text-green-600">+$50.00</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Side: Sidebar -->
            <div class="space-y-8">
                <!-- Payment Methods -->
                <div class="bg-white rounded-3xl p-8 shadow-sm border border-gray-100">
                    <h2 class="text-lg font-bold text-gray-900 mb-6">Payment Methods</h2>
                    <div class="space-y-4 mb-6">
                        <div class="p-4 rounded-2xl border-2 border-blue-100 bg-blue-50/30 flex items-center justify-between">
                            <div class="flex items-center">
                                <span class="bg-white p-2 rounded-lg mr-3 shadow-sm font-bold text-xs text-gray-700">VISA</span>
                                <span class="text-sm font-bold text-gray-900">**** 4421</span>
                            </div>
                            <div class="w-2 h-2 rounded-full bg-blue-600"></div>
                        </div>
                    </div>
                    <button class="w-full py-3 rounded-2xl border-2 border-dashed border-gray-200 text-gray-400 font-bold hover:border-blue-300 hover:text-blue-500 transition">
                        + Add Method
                    </button>
                </div>

                <!-- Support & Settings -->
                <div class="bg-white rounded-3xl p-6 shadow-sm border border-gray-100 space-y-2">
                    <a href="#" class="flex items-center p-3 rounded-2xl hover:bg-gray-50 transition text-gray-700 font-medium">
                        <svg class="h-5 w-5 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                        Settings
                    </a>
                    <a href="#" class="flex items-center p-3 rounded-2xl hover:bg-gray-50 transition text-gray-700 font-medium">
                        <svg class="h-5 w-5 mr-3 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        Help Center
                    </a>
                </div>
            </div>
        </div>
    </main>

</body>
</html>
