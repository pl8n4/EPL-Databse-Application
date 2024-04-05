from flask import Flask
from extensions import db 

def create_app():
    app = Flask(__name__)
    
    # Configure the database URI
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:root@localhost/EPL'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    
    db.init_app(app)
    
    # Import routes here to avoid circular imports
    from routes.player_routes import setup_player_routes
    from routes.team_routes import setup_team_routes
    from routes.match_routes import setup_match_routes
    
    # Initialize route setups
    setup_player_routes(app)
    setup_team_routes(app)
    setup_match_routes(app)
    
    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)