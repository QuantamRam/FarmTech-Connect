use client'

import React, { useState } from 'react'
import Link from 'next/link'
import { Button } from "@/components/ui/button"
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select"
import { ArrowLeft, FileText, Tractor, Sprout, Droplets } from 'lucide-react'

// Simulated scheme recommendation function
const getRecommendations = (farmSize, cropType, state) => {
  return new Promise((resolve) => {
    setTimeout(() => {
      const schemes = [
        {
          name: "PM-KISAN",
          description: "Direct income support of ₹6,000 per year to eligible farmer families.",
          eligibility: "All farmer families with cultivable land.",
          link: "https://pmkisan.gov.in/"
        },
        {
          name: "Pradhan Mantri Fasal Bima Yojana (PMFBY)",
          description: "Crop insurance scheme to provide financial support to farmers suffering crop loss/damage.",
          eligibility: "All farmers growing notified crops in notified areas.",
          link: "https://pmfby.gov.in/"
        },
        {
          name: "Kisan Credit Card (KCC)",
          description: "Provides farmers with timely access to credit.",
          eligibility: "All farmers, including small farmers, marginal farmers, and agricultural laborers.",
          link: "https://www.nabard.org/content1.aspx?id=572&catid=23&mid=530"
        },
      ]
      resolve(schemes)
    }, 2000)
  })
}

export default function GovernmentSchemes() {
  const [formData, setFormData] = useState({
    farmSize: '',
    cropType: '',
    state: '',
  })
  const [recommendations, setRecommendations] = useState([])
  const [loading, setLoading] = useState(false)

  const handleSubmit = async (e) => {
    e.preventDefault()
    setLoading(true)
    const results = await getRecommendations(formData.farmSize, formData.cropType, formData.state)
    setRecommendations(results)
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
          <h1 className="text-2xl font-bold">Farm Tech Connect - Government Schemes</h1>
        </div>
      </header>

      <main className="container mx-auto px-4 py-8">
        <Card className="mb-8 border-orange-200">
          <CardHeader className="bg-orange-100">
            <CardTitle className="text-orange-800">Find Suitable Government Schemes</CardTitle>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="farmSize" className="text-orange-800">Farm Size (Acres)</Label>
                  <Input
                    id="farmSize"
                    name="farmSize"
                    type="number"
                    value={formData.farmSize}
                    onChange={(e) => handleInputChange('farmSize', e.target.value)}
                    placeholder="Enter farm size"
                    className="border-orange-300"
                    required
                  />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="cropType" className="text-orange-800">Primary Crop</Label>
                  <Select name="cropType" onValueChange={(value) => handleInputChange('cropType', value)} required>
                    <SelectTrigger className="border-orange-300">
                      <SelectValue placeholder="Select primary crop" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="rice">Rice</SelectItem>
                      <SelectItem value="wheat">Wheat</SelectItem>
                      <SelectItem value="pulses">Pulses</SelectItem>
                      <SelectItem value="oilseeds">Oilseeds</SelectItem>
                      <SelectItem value="horticulture">Horticulture</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
                <div className="space-y-2">
                  <Label htmlFor="state" className="text-orange-800">State</Label>
                  <Select name="state" onValueChange={(value) => handleInputChange('state', value)} required>
                    <SelectTrigger className="border-orange-300">
                      <SelectValue placeholder="Select your state" />
                    </SelectTrigger>
                    <SelectContent>
                      <SelectItem value="maharashtra">Maharashtra</SelectItem>
                      <SelectItem value="punjab">Punjab</SelectItem>
                      <SelectItem value="karnataka">Karnataka</SelectItem>
                      <SelectItem value="gujarat">Gujarat</SelectItem>
                      <SelectItem value="madhyapradesh">Madhya Pradesh</SelectItem>
                    </SelectContent>
                  </Select>
                </div>
              </div>
              <Button type="submit" className="w-full bg-orange-600 hover:bg-orange-700" disabled={loading}>
                {loading ? 'Analyzing...' : 'Find Schemes'}
              </Button>
            </form>
          </CardContent>
        </Card>

        {recommendations.length > 0 && (
          <Card className="border-orange-200">
            <CardHeader className="bg-orange-100">
              <CardTitle className="text-orange-800">Recommended Government Schemes</CardTitle>
            </CardHeader>
            <CardContent>
              <div className="space-y-6">
                {recommendations.map((scheme, index) => (
                  <Card key={index} className="border-orange-200">
                    <CardHeader className="bg-orange-50">
                      <CardTitle className="text-orange-800 flex items-center">
                        {index === 0 && <Tractor className="h-6 w-6 mr-2 text-green-600" />}
                        {index === 1 && <Sprout className="h-6 w-6 mr-2 text-green-600" />}
                        {index === 2 && <Droplets className="h-6 w-6 mr-2 text-green-600" />}
                        {scheme.name}
                      </CardTitle>
                    </CardHeader>
                    <CardContent>
                      <p className="text-orange-900 mb-2">{scheme.description}</p>
                      <p className="text-orange-800 font-semibold mb-2">Eligibility: {scheme.eligibility}</p>
                      <Link href={scheme.link} target="_blank" rel="noopener noreferrer">
                        <Button variant="outline" className="mt-2 border-orange-600 text-orange-600 hover:bg-orange-100">
                          <FileText className="mr-2 h-4 w-4" />
                          Learn More
                        </Button>
                      </Link>
                    </CardContent>
                  </Card>
                ))}
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
