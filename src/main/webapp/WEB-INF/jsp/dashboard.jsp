<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Bikes - PedalGo</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .glass { background: rgba(255, 255, 255, 0.7); backdrop-filter: blur(10px); }
        .bike-card:hover .bike-image { transform: scale(1.05); }
    </style>
</head>
<body class="bg-gray-50 min-h-screen">

    <!-- Top Navigation -->
    <nav class="sticky top-0 z-50 glass border-b border-gray-200">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <span class="text-2xl font-extrabold text-blue-600 tracking-tight">PedalGo</span>
                    <div class="hidden md:ml-10 md:flex md:space-x-8">
                        <a href="/dashboard" class="border-blue-500 text-gray-900 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium">Marketplace</a>
                        <a href="#" class="border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium">My Rentals</a>
                        <a href="#" class="border-transparent text-gray-500 hover:text-gray-700 hover:border-gray-300 inline-flex items-center px-1 pt-1 border-b-2 text-sm font-medium">Support</a>
                    </div>
                </div>
                <div class="flex items-center space-x-4">
                    <div class="relative hidden sm:block">
                        <input type="text" placeholder="Search bikes..." class="bg-gray-100 border-none rounded-full py-2 px-4 text-sm focus:ring-2 focus:ring-blue-500 w-64 transition-all">
                    </div>
                    <button class="text-gray-500 hover:text-blue-600 transition">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path></svg>
                    </button>
                    <a href="/profile" class="h-10 w-10 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 font-bold border-2 border-white shadow-sm cursor-pointer hover:border-blue-300 transition">
                        <c:out value="${fn:toUpperCase(fn:substring(user.name, 0, 1))}" />
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <!-- Dashboard Header -->
        <div class="mb-8">
            <h1 class="text-3xl font-extrabold text-gray-900">Explore Available Rides</h1>
            <p class="text-gray-500 mt-1">Discover the perfect bike for your next journey.</p>
        </div>

        <!-- Filters & Categories -->
        <div class="flex flex-col md:flex-row md:items-center justify-between mb-10 space-y-4 md:space-y-0">
            <div class="flex space-x-2 overflow-x-auto pb-2 md:pb-0 scrollbar-hide">
                <button class="px-5 py-2 rounded-full bg-blue-600 text-white font-medium shadow-md transition whitespace-nowrap">All Rides</button>
                <button class="px-5 py-2 rounded-full bg-white border border-gray-200 text-gray-700 font-medium hover:bg-gray-50 transition shadow-sm whitespace-nowrap">Electric</button>
                <button class="px-5 py-2 rounded-full bg-white border border-gray-200 text-gray-700 font-medium hover:bg-gray-50 transition shadow-sm whitespace-nowrap">Mountain</button>
                <button class="px-5 py-2 rounded-full bg-white border border-gray-200 text-gray-700 font-medium hover:bg-gray-50 transition shadow-sm whitespace-nowrap">City Cruiser</button>
                <button class="px-5 py-2 rounded-full bg-white border border-gray-200 text-gray-700 font-medium hover:bg-gray-50 transition shadow-sm whitespace-nowrap">Road</button>
            </div>
            <div class="flex items-center space-x-3">
                <span class="text-sm text-gray-500 font-medium tracking-wide border-r pr-3 mr-1">SORT BY:</span>
                <select class="bg-transparent border-none text-sm font-semibold text-gray-800 focus:ring-0 cursor-pointer">
                    <option>Recommended</option>
                    <option>Price: Low to High</option>
                    <option>Price: High to Low</option>
                    <option>Near Me</option>
                </select>
            </div>
        </div>

        <!-- Bike Marketplace Grid -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
            
            <c:forEach var="bike" items="${bikes}">
                <!-- Dynamic Bike Card -->
                <div class="bike-card bg-white rounded-2xl overflow-hidden shadow-sm hover:shadow-xl transition-all duration-300 border border-gray-100 group cursor-pointer">
                    <div class="relative overflow-hidden h-56">
                        <img src="${bike.imagePath}" alt="${bike.name}" class="bike-image w-full h-full object-cover transition-transform duration-500">
                        <div class="absolute top-4 left-4 ${bike.type == 'Electric' ? 'bg-blue-600' : bike.type == 'Mountain' ? 'bg-orange-600' : 'bg-purple-600'} text-white text-xs font-bold px-2.5 py-1 rounded-md uppercase tracking-wider shadow-lg">
                            ${bike.type}
                        </div>
                        <div class="absolute top-4 right-4 bg-white/90 backdrop-blur-sm p-1.5 rounded-full shadow-sm">
                            <svg class="h-5 w-5 text-gray-400 hover:text-red-500 transition" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path></svg>
                        </div>
                    </div>
                    <div class="p-6">
                        <div class="flex justify-between items-start mb-2">
                            <h3 class="text-lg font-bold text-gray-900 group-hover:text-blue-600 transition">${bike.name}</h3>
                            <div class="flex items-center bg-green-50 px-2 py-0.5 rounded">
                                <span class="text-green-700 text-xs font-bold">4.8</span>
                                <svg class="h-3 w-3 text-green-500 ml-1" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path></svg>
                            </div>
                        </div>
                        <p class="text-sm text-gray-500 mb-4 flex items-center">
                            <svg class="h-4 w-4 mr-1 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                            ${bike.location}
                        </p>
                        <div class="flex items-center justify-between border-t pt-4">
                            <div class="flex items-baseline">
                                <span class="text-2xl font-extrabold text-blue-600">$<c:out value="${bike.pricePerHour}" /></span>
                                <span class="text-gray-500 text-sm font-medium ml-1">/hr</span>
                            </div>
                            <button class="bg-gray-50 hover:bg-blue-600 hover:text-white px-4 py-2 rounded-xl text-sm font-bold transition duration-300">Rent Now</button>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <c:if test="${empty bikes}">
                <div class="col-span-full border-2 border-dashed border-gray-200 rounded-2xl flex flex-col items-center justify-center p-8 text-center text-gray-400 min-h-[350px]">
                    <p class="font-medium">No bikes available at the moment.</p>
                </div>
            </c:if>

            <!-- Placeholder for more bikes -->
            <div class="border-2 border-dashed border-gray-200 rounded-2xl flex flex-col items-center justify-center p-8 text-center text-gray-400 hover:border-blue-300 transition group cursor-pointer min-h-[350px]">
                <div class="bg-gray-100 p-4 rounded-full mb-4 group-hover:bg-blue-50 transition">
                    <svg class="h-8 w-8 group-hover:text-blue-500 transition" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                </div>
                <p class="font-medium">More bikes coming soon</p>
            </div>

        </div>
    </main>

    <!-- Bottom Mobile Navigation -->
    <div class="md:hidden fixed bottom-6 left-1/2 transform -translate-x-1/2 w-[90%] glass rounded-2xl shadow-2xl border border-gray-200 py-3 px-6 z-50">
        <div class="flex justify-between items-center">
            <a href="#" class="text-blue-600 flex flex-col items-center"><svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24"><path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"></path></svg></a>
            <a href="#" class="text-gray-400 flex flex-col items-center"><svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path></svg></a>
            <div class="bg-blue-600 p-3 rounded-full -mt-10 shadow-lg border-4 border-white">
                <svg class="h-6 w-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path></svg>
            </div>
            <a href="#" class="text-gray-400 flex flex-col items-center"><svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg></a>
            <a href="#" class="text-gray-400 flex flex-col items-center"><svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path></svg></a>
        </div>
    </div>

</body>
</html>
