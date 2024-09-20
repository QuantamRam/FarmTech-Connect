'use client'

import React, { useState } from 'react'
import Link from 'next/link'
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { ArrowLeft, Loader2, Sprout, Droplets, Thermometer, Mountain } from 'lucide-react'
import {
  RadarChart,
  PolarGrid,
  PolarAngleAxis,
  PolarRadiusAxis,
  Radar,
  ResponsiveContainer
} from 'recharts'

// Simulated crop recommendation function
const getRecommendations = (nitrogen, phosphorus, potassium, temperature, humidity, ph, rainfall) => {
  return new Promise((resolve) => {
    setTimeout(() => {
      const crops = [
        { name: 'Rice', suitability: Math.random() * 100 },
        { name: 'Wheat', suitability: Math.random() * 100 },
        { name: 'Maize', suitability: Math.random() * 100 },
        { name: 'Chickpeas', suitability: Math.random() * 100 },
        { name: 'Soybeans', suitability: Math.random() * 100 },
      ]
      const sortedCrops = crops.sort((a, b) => b.suitability - a.suitability)
      resolve({
        recommendedCrop: sortedCrops[0].name,
        suitabilityScores: sortedCrops
      })
    }, 2000)
  })
}

export default function CropRecommendation() {
  const [formData, setFormData] = useState({
    nitrogen: '',
    phosphorus: '',
    potassium: '',
    temperature: '',
    humidity: '',
    ph: '',
    rainfall: '',
  })
  const [recommendation, setRecommendation] = useState(null)
  const [loading, setLoading] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    setLoading(true)
    const results = await getRecommendations(
      formData.nitrogen,
      formData.phosphorus,
      formData.potassium,
      formData.temperature,
      formData.humidity,
      formData.ph,
      formData.rainfall
    )
    setRecommendation(results)
    setLoading(false)
  }

  const handleInputChange = (name, value) => {
    setFormData(prev => ({ ...prev, [name]: value }))
  }

  return (
    <div className="min-h-screen bg-orange-50">
      <header className="bg-green-700 text-white p-4">
        <div className="container mx-auto flex items-center">
          <Link href="/" className="text-white hover:text-green-200 mr-4">
            <ArrowLeft className="h-6 w-6" />
          </Link>
          <h1 className="text-2xl font-bold">Farm Tech Connect - Crop Recommendation</h1>
        </div>
      </header>

      <main className="container mx-auto px-4 py-8">
        <Card className="mb-8 border-orange-200">
          <CardHeader className="bg-orange-100">
            <CardTitle className="text-orange-800">Get Crop Recommendations</CardTitle>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="nitrogen" className="text-orange-800">Nitrogen (N) in soil</Label>
                  <Input
                    id="nitrogen"
                    name="nitrogen"
                    type="number"
                    value={formData.nitrogen}
                    onChange={(e) => handleInputChange('nitrogen', e.target.value)}
                    placeholder="Enter N value (mg/kg)"
                    className="border-orange-300"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="phosphorus" className="text-orange-800">Phosphorus (P) in soil</Label>
                  <Input
                    id="phosphorus"
                    name="phosphorus"
                    type="number"
                    value={formData.phosphorus}
                    onChange={(e) => handleInputChange('phosphorus', e.target.value)}
                    placeholder="Enter P value (mg/kg)"
                    className="border-orange-300"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="potassium" className="text-orange-800">Potassium (K) in soil</Label>
                  <Input
                    id="potassium"
                    name="potassium"
                    type="number"
                    value={formData.potassium}
                    onChange={(e) => handleInputChange('potassium', e.target.value)}
                    placeholder="Enter K value (mg/kg)"
                    className="border-orange-300"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="temperature" className="text-orange-800">Temperature (°C)</Label>
                  <Input
                    id="temperature"
                    name="temperature"
                    type="number"
                    value={formData.temperature}
                    onChange={(e) => handleInputChange('temperature', e.target.value)}
                    placeholder="Enter average temperature"
                    className="border-orange-300"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="humidity" className="text-orange-800">Humidity (%)</Label>
                  <Input
                    id="humidity"
                    name="humidity"
                    type="number"
                    value={formData.humidity}
                    onChange={(e) => handleInputChange('humidity', e.target.value)}
                    placeholder="Enter average humidity"
                    className="border-orange-300"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="ph" className="text-orange-800">Soil pH</Label>
                  <Input
                    id="ph"
                    name="ph"
                    type="number"
                    value={formData.ph}
                    onChange={(e) => handleInputChange('ph', e.target.value)}
                    placeholder="Enter soil pH"
                    className="border-orange-300"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="rainfall" className="text-orange-800">Annual Rainfall (mm)</Label>
                  <Input
                    id="rainfall"
                    name="rainfall"
                    type="number"
                    value={formData.rainfall}
                    onChange={(e) => handleInputChange('rainfall', e.target.value)}
                    placeholder="Enter annual rainfall"
                    className="border-orange-300"
                    required
                  />
                </div>
              </div>
              <Button type="submit" className="w-full bg-orange-600 hover:bg-orange-700" disabled={loading}>
                {loading ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    Analyzing...
                  </>
                ) : (
                  'Get Recommendations'
                )}
              </Button>
            </form>
          </CardContent>
        </Card>

        {recommendation && (
          <Card className="border-orange-200">
            <CardHeader className="bg-orange-100">
              <CardTitle className="text-orange-800">Crop Recommendations</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="mb-6">
                <p className="text-lg font-semibold text-orange-800">Best Recommended Crop:</p>
                <div className="flex items-center">
                  <Sprout className="h-6 w-6 mr-2 text-green-500" />
                  <p className="text-2xl font-bold text-orange-900">{recommendation.recommendedCrop}</p>
                </div>
              </div>
              <div className="h-80 w-full mb-6">
                <ResponsiveContainer width="100%" height="100%">
                  <RadarChart cx="50%" cy="50%" outerRadius="80%" data={recommendation.suitabilityScores}>
                    <PolarGrid />
                    <PolarAngleAxis dataKey="name" />
                    <PolarRadiusAxis angle={30} domain={[0, 100]} />
                    <Radar name="Suitability" dataKey="suitability" stroke="#8884d8" fill="#8884d8" fillOpacity={0.6} />
                  </RadarChart>
                </ResponsiveContainer>
              </div>
              <div className="space-y-4">
                <p className="font-semibold text-orange-800">Crop Suitability Analysis:</p>
                {recommendation.suitabilityScores.map((crop, index) => (
                  <div key={index} className="flex items-center justify-between">
                    <span className="text-orange-900">{crop.name}</span>
                    <span className="text-orange-800 font-semibold">{Math.round(crop.suitability)}% suitable</span>
                  </div>
                ))}
              </div>
              <div className="mt-6 space-y-4">
                <p className="font-semibold text-orange-800">Key Factors Influencing Recommendation:</p>
                <div className="flex items-start">
                  <Droplets className="h-6 w-6 mr-2 text-blue-500 mt-1" />
                  <p className="text-orange-900">Soil nutrient levels (N, P, K) play a crucial role in crop selection and growth.</p>
                </div>
                <div className="flex items-start">
                  <Thermometer className="h-6 w-6 mr-2 text-red-500 mt-1" />
                  <p className="text-orange-900">Temperature and humidity affect crop growth and susceptibility to diseases.</p>
                </div>
                <div className="flex items-start">
                  <Mountain className="h-6 w-6 mr-2 text-green-500 mt-1" />
                  <p className="text-orange-900">Soil pH and rainfall patterns influence nutrient availability and water management needs.</p>
                </div>
              </div>
            </CardContent>
          </Card>
        )}
      </main>

      <footer className="bg-green-700 text-white p-4 mt-12">
        <div className="container mx-auto text-center">
          <p>&copy; 2023 Farm Tech Connect. All rights reserved.</p>
        </div>
      </footer>
    </div>
  )
}
