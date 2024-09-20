'use client'

import React, { useState } from 'react'
import Link from 'next/link'
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { ArrowLeft, TrendingUp, TrendingDown, Loader2 } from 'lucide-react'
import {
  LineChart,
  Line,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer
} from 'recharts'

// Simulated market rate prediction function
const getPredictions = (crop, state) => {
  return new Promise((resolve) => {
    setTimeout(() => {
      const basePrice = Math.floor(Math.random() * 5000) + 1000
      const data = [
        { month: 'Jan', actual: basePrice, predicted: basePrice },
        { month: 'Feb', actual: basePrice * 1.02, predicted: basePrice * 1.03 },
        { month: 'Mar', actual: basePrice * 1.05, predicted: basePrice * 1.06 },
        { month: 'Apr', actual: basePrice * 1.08, predicted: basePrice * 1.10 },
        { month: 'May', actual: null, predicted: basePrice * 1.12 },
        { month: 'Jun', actual: null, predicted: basePrice * 1.15 },
        { month: 'Jul', actual: null, predicted: basePrice * 1.18 },
      ]
      resolve({
        crop,
        state,
        currentPrice: Math.round(basePrice * 1.08),
        predictedPrice: Math.round(basePrice * 1.18),
        trend: Math.random() > 0.5 ? 'up' : 'down',
        data
      })
    }, 2000)
  })
}

export default function MarketRatePredictions() {
  const [formData, setFormData] = useState({
    crop: '',
    state: '',
  })
  const [predictions, setPredictions] = useState(null)
  const [loading, setLoading] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    setLoading(true)
    const results = await getPredictions(formData.crop, formData.state)
    setPredictions(results)
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
          <h1 className="text-2xl font-bold">Farm Tech Connect - Market Rate Predictions</h1>
        </div>
      </header>

      <main className="container mx-auto px-4 py-8">
        <Card className="mb-8 border-orange-200">
          <CardHeader className="bg-orange-100">
            <CardTitle className="text-orange-800">Get Market Rate Predictions</CardTitle>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="crop" className="text-orange-800">Crop</Label>
                  <Select name="crop" onValueChange={(value) => handleInputChange('crop', value)} required>
                    <SelectTrigger className="border-orange-300">
                      <SelectValue placeholder="Select a crop" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="rice">Rice</SelectItem>
                      <SelectItem value="wheat">Wheat</SelectItem>
                      <SelectItem value="maize">Maize</SelectItem>
                      <SelectItem value="soybean">Soybean</SelectItem>
                      <SelectItem value="cotton">Cotton</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="state" className="text-orange-800">State</Label>
                  <Select name="state" onValueChange={(value) => handleInputChange('state', value)} required>
                    <SelectTrigger className="border-orange-300">
                      <SelectValue placeholder="Select a state" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="punjab">Punjab</SelectItem>
                      <SelectItem value="haryana">Haryana</SelectItem>
                      <SelectItem value="up">Uttar Pradesh</SelectItem>
                      <SelectItem value="mp">Madhya Pradesh</SelectItem>
                      <SelectItem value="gujarat">Gujarat</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>
              <Button type="submit" className="w-full bg-orange-600 hover:bg-orange-700" disabled={loading}>
                {loading ? (
                  <>
                    <Loader2 className="mr-2 h-4 w-4 animate-spin" />
                    Analyzing...
                  </>
                ) : (
                  'Get Predictions'
                )}
              </Button>
            </form>
          </CardContent>
        </Card>

        {predictions && (
          <Card className="border-orange-200">
            <CardHeader className="bg-orange-100">
              <CardTitle className="text-orange-800">Market Rate Predictions for {predictions.crop} in {predictions.state}</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="grid md:grid-cols-2 gap-4 mb-6">
                <div className="space-y-2">
                  <p className="text-lg font-semibold text-orange-800">Current Price</p>
                  <p className="text-3xl font-bold text-orange-900">₹{predictions.currentPrice}/quintal</p>
                </div>
                <div className="space-y-2">
                  <p className="text-lg font-semibold text-orange-800">Predicted Price (3 months)</p>
                  <p className="text-3xl font-bold text-orange-900 flex items-center">
                    ₹{predictions.predictedPrice}/quintal
                    {predictions.trend === 'up' ? (
                      <TrendingUp className="ml-2 h-6 w-6 text-green-500" />
                    ) : (
                      <TrendingDown className="ml-2 h-6 w-6 text-red-500" />
                    )}
                  </p>
                </div>
              </div>
              <div className="h-80 w-full">
                <ResponsiveContainer width="100%" height="100%">
                  <LineChart
                    data={predictions.data}
                    margin={{
                      top: 5,
                      right: 30,
                      left: 20,
                      bottom: 5,
                    }}
                  >
                    <CartesianGrid strokeDasharray="3 3" />
                    <XAxis dataKey="month" />
                    <YAxis />
                    <Tooltip />
                    <Legend />
                    <Line type="monotone" dataKey="actual" stroke="#8884d8" activeDot={{ r: 8 }} />
                    <Line type="monotone" dataKey="predicted" stroke="#82ca9d" />
                  </LineChart>
                </ResponsiveContainer>
              </div>
              <div className="mt-4 text-orange-800">
                <p className="font-semibold">Analysis:</p>
                <p>Based on our ML predictions, the price of {predictions.crop} in {predictions.state} is expected to 
                  {predictions.trend === 'up' ? ' increase ' : ' decrease '} 
                  over the next 3 months. Factors influencing this prediction include historical price trends, current market demand, and anticipated crop yield.</p>
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
