import React from 'react'
import Link from 'next/link'
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { AlertTriangle, Sprout, TrendingUp, Menu, BarChart, CloudRain, Thermometer, Wind } from 'lucide-react'

export default function HomePage() {
  return (
    <div className="min-h-screen bg-orange-50">
      <header className="bg-green-700 text-white p-4">
        <div className="container mx-auto flex justify-between items-center">
          <h1 className="text-2xl font-bold">Farm Tech Connect</h1>
          <nav className="hidden md:block">
            <ul className="flex space-x-4">
              <li><a href="#disaster" className="hover:underline">Disaster Management</a></li>
              <li><a href="#prediction" className="hover:underline">ML Predictions</a></li>
              <li><a href="#market" className="hover:underline">Market Rates</a></li>
              <li>
                <Link href="/crop-recommendation" className="hover:underline">
                  Crop Recommendation
                </Link>
              </li>
            </ul>
          </nav>
          <Button variant="outline" size="icon" className="md:hidden">
            <Menu className="h-6 w-6" />
          </Button>
        </div>
      </header>

      <main className="container mx-auto mt-8 px-4">
        <section className="mb-12 text-center">
          <h2 className="text-3xl font-bold mb-4 text-orange-800">Welcome to Farm Tech Connect</h2>
          <p className="text-xl text-orange-700">Your AI-powered smart farming companion for Indian agriculture</p>
        </section>

        <Tabs defaultValue="disaster" className="mb-12">
          <TabsList className="grid w-full grid-cols-3">
            <TabsTrigger value="disaster">Disaster Management</TabsTrigger>
            <TabsTrigger value="prediction">ML Predictions</TabsTrigger>
            <TabsTrigger value="market">Market Rates</TabsTrigger>
          </TabsList>
          <TabsContent value="disaster">
            <Card className="border-orange-200">
              <CardHeader className="bg-orange-100">
                <CardTitle className="text-orange-800">AI-Powered Disaster Management</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="flex items-center mb-4">
                  <AlertTriangle className="h-6 w-6 mr-2 text-red-500" />
                  <h3 className="text-lg font-semibold text-orange-700">Early Warning System for Indian Agriculture</h3>
                </div>
                <p className="text-orange-900 mb-4">Our advanced machine learning models analyze multiple data sources to predict and alert you about potential natural disasters affecting Indian farmlands:</p>
                <ul className="list-disc list-inside mb-4 text-orange-900">
                  <li>Monsoon patterns and flood predictions</li>
                  <li>Drought forecasting using satellite imagery</li>
                  <li>Locust swarm movement predictions</li>
                  <li>Cyclone path and intensity forecasts for coastal regions</li>
                </ul>
                <p className="text-orange-900 mb-4">We integrate data from the India Meteorological Department (IMD) and Indian Space Research Organisation (ISRO) to provide accurate, localized alerts.</p>
                <Button className="mt-4 bg-orange-600 hover:bg-orange-700">View Disaster Alerts</Button>
              </CardContent>
            </Card>
          </TabsContent>
          <TabsContent value="prediction">
            <Card className="border-orange-200">
              <CardHeader className="bg-orange-100">
                <CardTitle className="text-orange-800">ML-Based Agricultural Predictions</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="flex items-center mb-4">
                  <BarChart className="h-6 w-6 mr-2 text-blue-500" />
                  <h3 className="text-lg font-semibold text-orange-700">Precision Farming Insights</h3>
                </div>
                <p className="text-orange-900 mb-4">Our machine learning models provide crucial predictions for Indian farming conditions:</p>
                <div className="grid md:grid-cols-2 gap-4 mb-4">
                  <div className="flex items-start">
                    <CloudRain className="h-6 w-6 mr-2 text-blue-500 mt-1" />
                    <div>
                      <h4 className="font-semibold text-orange-700">Rainfall Prediction</h4>
                      <p className="text-orange-900">Accurate forecasts for your specific location</p>
                    </div>
                  </div>
                  <div className="flex items-start">
                    <Thermometer className="h-6 w-6 mr-2 text-red-500 mt-1" />
                    <div>
                      <h4 className="font-semibold text-orange-700">Temperature Trends</h4>
                      <p className="text-orange-900">Long-term temperature projections for crop planning</p>
                    </div>
                  </div>
                  <div className="flex items-start">
                    <Sprout className="h-6 w-6 mr-2 text-green-500 mt-1" />
                    <div>
                      <h4 className="font-semibold text-orange-700">Crop Yield Estimation</h4>
                      <p className="text-orange-900">AI-driven yield predictions for major Indian crops</p>
                    </div>
                  </div>
                  <div className="flex items-start">
                    <Wind className="h-6 w-6 mr-2 text-gray-500 mt-1" />
                    <div>
                      <h4 className="font-semibold text-orange-700">Soil Health Analysis</h4>
                      <p className="text-orange-900">ML-based soil quality and nutrient predictions</p>
                    </div>
                  </div>
                </div>
                <p className="text-orange-900 mb-4">Our models are trained on extensive Indian agricultural data, ensuring relevance to local conditions and crop varieties.</p>
                <Link href="/ml-predictions">
                  <Button className="mt-4 bg-orange-600 hover:bg-orange-700">Access ML Predictions</Button>
                </Link>
              </CardContent>
            </Card>
          </TabsContent>
          <TabsContent value="market">
            <Card className="border-orange-200">
              <CardHeader className="bg-orange-100">
                <CardTitle className="text-orange-800">AI-Driven Market Rate Insights</CardTitle>
              </CardHeader>
              <CardContent>
                <div className="flex items-center mb-4">
                  <TrendingUp className="h-6 w-6 mr-2 text-green-500" />
                  <h3 className="text-lg font-semibold text-orange-700">Real-time Price Analytics for Indian Markets</h3>
                </div>
                <p className="text-orange-900 mb-4">Our machine learning algorithms analyze vast amounts of data to provide accurate market insights for Indian farmers:</p>
                <ul className="list-disc list-inside mb-4 text-orange-900">
                  <li>Real-time prices from major Agricultural Produce Market Committees (APMCs) across India</li>
                  <li>Price predictions for the next 1-3 months for major crops</li>
                  <li>Supply and demand forecasts based on crop yield predictions and market trends</li>
                  <li>Personalized price alerts for your specific crops and region</li>
                </ul>
                <p className="text-orange-900 mb-4">We integrate data from the National Agriculture Market (eNAM) and state-level market information systems to provide comprehensive coverage.</p>
                <Button className="mt-4 bg-orange-600 hover:bg-orange-700">Check Market Rates</Button>
              </CardContent>
            </Card>
          </TabsContent>
        </Tabs>

        <section className="mb-12">
          <h2 className="text-2xl font-bold mb-4 text-orange-800">How Farm Tech Connect Empowers Indian Farmers</h2>
          <div className="grid md:grid-cols-3 gap-6">
            <Card className="border-orange-200">
              <CardHeader className="bg-orange-100">
                <CardTitle className="text-orange-800">Disaster Resilience</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-orange-900">Stay prepared with AI-powered alerts and actionable advice tailored to India's diverse agro-climatic zones.</p>
              </CardContent>
            </Card>
            <Card className="border-orange-200">
              <CardHeader className="bg-orange-100">
                <CardTitle className="text-orange-800">Data-Driven Decisions</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-orange-900">Make informed choices about crop selection, planting times, and resource management based on ML predictions.</p>
              </CardContent>
            </Card>
            <Card className="border-orange-200">
              <CardHeader className="bg-orange-100">
                <CardTitle className="text-orange-800">Market Intelligence</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-orange-900">Maximize profits with AI-driven market insights, helping you decide when and where to sell your produce.</p>
              </CardContent>
            </Card>
          </div>
        </section>
      </main>

      <footer className="bg-green-700 text-white p-4 mt-12">
        <div className="container mx-auto text-center">
          <p>&copy; 2023 Farm Tech Connect. All rights reserved.</p>
        </div>
      </footer>
    </div>
  )
}
