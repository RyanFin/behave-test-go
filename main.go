package main

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func main() {
	router := gin.Default()

	// Health check endpoint
	router.GET("/health", func(c *gin.Context) {
		c.JSON(http.StatusOK, gin.H{"status": "healthy"})
	})

	// Cars endpoint
	router.GET("/cars", func(c *gin.Context) {
		cars := []map[string]interface{}{
			{"make": "Toyota", "model": "Corolla", "year": 2020},
			{"make": "Honda", "model": "Civic", "year": 2019},
			{"make": "Ford", "model": "Mustang", "year": 2021},
		}
		c.JSON(http.StatusOK, cars)
	})

	router.Run(":8080")
}
