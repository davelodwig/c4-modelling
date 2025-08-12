workspace "C4 Modelling Examples" "Sample code used for the software engineering community at CGI" {

	!docs docs

	!adrs adrs

	model {
	
		# Personas
		user = person "User" "A standard system user" {
			tags "Persona"
		}

		admin = person "Admin" {
			tags "Persona"
		}

		# System		
		exampleSystem = softwareSystem "Example System" "An example software system" {

			proxy = container "Reverse Proxy"
			
			ui = container "Front End" "ReactJS" {
				tags "frontend"
			}

			api = container "Back End" "Python FastAPI"

			database = container "Database" "Postgres" {
				tags "database
			}

			proxy -> ui "Passes HTTP requests from the user" "HTTP"
			proxy -> api "Passes HTTP requests from the user" "HTTP"
			api -> database "Queries and stores data" "SQL"

		}

		user -> exampleSystem.proxy "Makes requests against the system" "HTTP"
		admin -> exampleSystem.proxy "Manages system features" "HTTP"

		# External Systems
		

	
	}

	views {

    	systemLandscape "SystemLandscape" {
        	include *
        	autolayout lr
    	}

		styles {
		
			element "frontend" {
				shape WebBrowser
			}
		
			element "microservice" {
				shape Hexagon
			}
		
			element "database" {
				shape Cylinder
			}
		
			element "queue" {
				shape Pipe
			}
		
		}
	
		themes default https://static.structurizr.com/themes/amazon-web-services-2023.01.31/theme.json https://static.structurizr.com/themes/kubernetes-v0.3/theme.json
	}
}