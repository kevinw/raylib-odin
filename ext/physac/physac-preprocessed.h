#line 71 "physac.h"
/**********************************************************************************************
*
*   Physac v1.0 - 2D Physics library for videogames
*
*   DESCRIPTION:
*
*   Physac is a small 2D physics engine written in pure C. The engine uses a fixed time-step thread loop
*   to simluate physics. A physics step contains the following phases: get collision information,
*   apply dynamics, collision solving and position correction. It uses a very simple struct for physic
*   bodies with a position vector to be used in any 3D rendering API.
*
*   CONFIGURATION:
*
*   #define PHYSAC_IMPLEMENTATION
*       Generates the implementation of the library into the included file.
*       If not defined, the library is in header only mode and can be included in other headers
*       or source files without problems. But only ONE file should hold the implementation.
*
*   #define PHYSAC_STATIC (defined by default)
*       The generated implementation will stay private inside implementation file and all
*       internal symbols and functions will only be visible inside that file.
*
*   #define PHYSAC_NO_THREADS
*       The generated implementation won't include pthread library and user must create a secondary thread to call PhysicsThread().
*       It is so important that the thread where PhysicsThread() is called must not have v-sync or any other CPU limitation.
*
*   #define PHYSAC_STANDALONE
*       Avoid raylib.h header inclusion in this file. Data types defined on raylib are defined
*       internally in the library and input management and drawing functions must be provided by
*       the user (check library implementation for further details).
*
*   #define PHYSAC_DEBUG
*       Traces log messages when creating and destroying physics bodies and detects errors in physics
*       calculations and reference exceptions; it is useful for debug purposes
*
*   #define PHYSAC_MALLOC()
*   #define PHYSAC_FREE()
*       You can define your own malloc/free implementation replacing stdlib.h malloc()/free() functions.
*       Otherwise it will include stdlib.h and use the C standard library malloc()/free() function.
*
*
*   NOTE 1: Physac requires multi-threading, when InitPhysics() a second thread is created to manage physics calculations.
*   NOTE 2: Physac requires static C library linkage to avoid dependency on MinGW DLL (-static -lpthread)
*
*   Use the following code to compile:
*   gcc -o $(NAME_PART).exe $(FILE_NAME) -s icon\physac_icon -static -lraylib -lpthread -lopengl32 -lgdi32 -std=c99
*
*   VERY THANKS TO:
*       Ramon Santamaria (github: @raysan5)
*
*
*   LICENSE: zlib/libpng
*
*   Copyright (c) 2016-2018 Victor Fisac (github: @victorfisac)
*
*   This software is provided "as-is", without any express or implied warranty. In no event
*   will the authors be held liable for any damages arising from the use of this software.
*
*   Permission is granted to anyone to use this software for any purpose, including commercial
*   applications, and to alter it and redistribute it freely, subject to the following restrictions:
*
*     1. The origin of this software must not be misrepresented; you must not claim that you
*     wrote the original software. If you use this software in a product, an acknowledgment
*     in the product documentation would be appreciated but is not required.
*
*     2. Altered source versions must be plainly marked as such, and must not be misrepresented
*     as being the original software.
*
*     3. This notice may not be removed or altered from any source distribution.
*
**********************************************************************************************/


#define PHYSAC_H

// #define PHYSAC_STATIC
// #define  PHYSAC_NO_THREADS
// #define  PHYSAC_STANDALONE
// #define  PHYSAC_DEBUG
#line 87 "physac.h"
        #define PHYSACDEF extern        // Functions visible from other files



//----------------------------------------------------------------------------------
// Defines and Macros
//----------------------------------------------------------------------------------
#define     PHYSAC_MAX_BODIES               64
#define     PHYSAC_MAX_MANIFOLDS            4096
#define     PHYSAC_MAX_VERTICES             24
#define     PHYSAC_CIRCLE_VERTICES          24

#define     PHYSAC_DESIRED_DELTATIME        1.0/60.0
#define     PHYSAC_MAX_TIMESTEP             0.02
#define     PHYSAC_COLLISION_ITERATIONS     100
#define     PHYSAC_PENETRATION_ALLOWANCE    0.05f
#define     PHYSAC_PENETRATION_CORRECTION   0.4f

#define     PHYSAC_PI                       3.14159265358979323846
#define     PHYSAC_DEG2RAD                  (PHYSAC_PI/180.0f)

#define     PHYSAC_MALLOC(size)             malloc(size)
#define     PHYSAC_FREE(ptr)                free(ptr)

//----------------------------------------------------------------------------------
// Types and Structures Definition
// NOTE: Below types are required for PHYSAC_STANDALONE usage
//----------------------------------------------------------------------------------
#line 129 "physac.h"
typedef enum PhysicsShapeType { PHYSICS_CIRCLE, PHYSICS_POLYGON } PhysicsShapeType;

// Previously defined to be used in PhysicsShape struct as circular dependencies
typedef struct PhysicsBodyData *PhysicsBody;

// Mat2 type (used for polygon shape rotation matrix)
typedef struct Mat2 {
    float m00;
    float m01;
    float m10;
    float m11;
} Mat2;

typedef struct PolygonData {
    unsigned int vertexCount;                   // Current used vertex and normals count
    Vector2 positions[24];     // Polygon vertex positions vectors
    Vector2 normals[24];       // Polygon vertex normals vectors
} PolygonData;

typedef struct PhysicsShape {
    PhysicsShapeType type;                      // Physics shape type (circle or polygon)
    PhysicsBody body;                           // Shape physics body reference
    float radius;                               // Circle shape radius (used for circle shapes)
    Mat2 transform;                             // Vertices transform matrix 2x2
    PolygonData vertexData;                     // Polygon shape vertices position and normals data (just used for polygon shapes)
} PhysicsShape;

typedef struct PhysicsBodyData {
    unsigned int id;                            // Reference unique identifier
    bool enabled;                               // Enabled dynamics state (collisions are calculated anyway)
    Vector2 position;                           // Physics body shape pivot
    Vector2 velocity;                           // Current linear velocity applied to position
    Vector2 force;                              // Current linear force (reset to 0 every step)
    float angularVelocity;                      // Current angular velocity applied to orient
    float torque;                               // Current angular force (reset to 0 every step)
    float orient;                               // Rotation in radians
    float inertia;                              // Moment of inertia
    float inverseInertia;                       // Inverse value of inertia
    float mass;                                 // Physics body mass
    float inverseMass;                          // Inverse value of mass
    float staticFriction;                       // Friction when the body has not movement (0 to 1)
    float dynamicFriction;                      // Friction when the body has movement (0 to 1)
    float restitution;                          // Restitution coefficient of the body (0 to 1)
    bool useGravity;                            // Apply gravity force to dynamics
    bool isGrounded;                            // Physics grounded on other body state
    bool freezeOrient;                          // Physics rotation constraint
    PhysicsShape shape;                         // Physics body shape information (type, radius, vertices, normals)
} PhysicsBodyData;

typedef struct PhysicsManifoldData {
    unsigned int id;                            // Reference unique identifier
    PhysicsBody bodyA;                          // Manifold first physics body reference
    PhysicsBody bodyB;                          // Manifold second physics body reference
    float penetration;                          // Depth of penetration from collision
    Vector2 normal;                             // Normal direction vector from 'a' to 'b'
    Vector2 contacts[2];                        // Points of contact during collision
    unsigned int contactsCount;                 // Current collision number of contacts
    float restitution;                          // Mixed restitution during collision
    float dynamicFriction;                      // Mixed dynamic friction during collision
    float staticFriction;                       // Mixed static friction during collision
} PhysicsManifoldData, *PhysicsManifold;





//----------------------------------------------------------------------------------
// Module Functions Declaration
//----------------------------------------------------------------------------------
PHYSACDEF void InitPhysics(void);                                                                           // Initializes physics values, pointers and creates physics loop thread
PHYSACDEF bool IsPhysicsEnabled(void);                                                                      // Returns true if physics thread is currently enabled
PHYSACDEF void SetPhysicsGravity(float x, float y);                                                         // Sets physics global gravity force
PHYSACDEF PhysicsBody CreatePhysicsBodyCircle(Vector2 pos, float radius, float density);                    // Creates a new circle physics body with generic parameters
PHYSACDEF PhysicsBody CreatePhysicsBodyRectangle(Vector2 pos, float width, float height, float density);    // Creates a new rectangle physics body with generic parameters
PHYSACDEF PhysicsBody CreatePhysicsBodyPolygon(Vector2 pos, float radius, int sides, float density);        // Creates a new polygon physics body with generic parameters
PHYSACDEF void PhysicsAddForce(PhysicsBody body, Vector2 force);                                            // Adds a force to a physics body
PHYSACDEF void PhysicsAddTorque(PhysicsBody body, float amount);                                            // Adds an angular force to a physics body
PHYSACDEF void PhysicsShatter(PhysicsBody body, Vector2 position, float force);                             // Shatters a polygon shape physics body to little physics bodies with explosion force
PHYSACDEF int GetPhysicsBodiesCount(void);                                                                  // Returns the current amount of created physics bodies
PHYSACDEF PhysicsBody GetPhysicsBody(int index);                                                            // Returns a physics body of the bodies pool at a specific index
PHYSACDEF int GetPhysicsShapeType(int index);                                                               // Returns the physics body shape type (PHYSICS_CIRCLE or PHYSICS_POLYGON)
PHYSACDEF int GetPhysicsShapeVerticesCount(int index);                                                      // Returns the amount of vertices of a physics body shape
PHYSACDEF Vector2 GetPhysicsShapeVertex(PhysicsBody body, int vertex);                                      // Returns transformed position of a body shape (body position + vertex transformed position)
PHYSACDEF void SetPhysicsBodyRotation(PhysicsBody body, float radians);                                     // Sets physics body shape transform based on radians parameter
PHYSACDEF void DestroyPhysicsBody(PhysicsBody body);                                                        // Unitializes and destroy a physics body
PHYSACDEF void ResetPhysics(void);                                                                          // Destroys created physics bodies and manifolds and resets global values
PHYSACDEF void ClosePhysics(void);                                                                          // Unitializes physics pointers and closes physics loop thread
PHYSACDEF void* PhysicsLoop(void* data);
#line 228 "physac.h"
/***********************************************************************************
*
*   PHYSAC IMPLEMENTATION
*
************************************************************************************/
