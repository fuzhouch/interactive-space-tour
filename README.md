# Project: Interactive Space Tour

This is a demo project for an interactive seminar, for
[New Space Economy](https://gdf.network/researches/new-space-economy/)
project.

Imagine a human living in outer space, let's say Mars. We, as designer,
want to demonstrate how human being live in outer spaces. It is of a
lot of use if we have an interactive, or playable scene, to visualize
the imagination in mind. Thus, we have this project created.

The Interactive Space Tour project, short for IST, is a 2D based
interactive course. It provides a set of scenes to show how a single
person live in a city located in Mars.

Meanwhile, the project itself is also part of our goals. A typical
interactive game requires multiple knowledge, such as visualization,
design, and computer programming. Unfortunately, designers do not have
chance to get all knowledge, esp., programming skills. Thus, a
communication is required, sometimes causes gaps of understanding.
With this project, we try to abstract an interaction model for a
typical interaction in outer spaces. Designer can use the content of
this project to create interactive units of their own, with almost zero
coding works.

With both goals met, we expect our designer audiences can gain the skill
of developing their own interactive scene by themselves.


## Tools

All materials of the project, is created by Open Source software, which
can be freely available from Internet. So everyone focus without
caring about issues like licenses. We managed to minimize a list of
tools as below:

1. The game engine. Our project is based on
   [Godot 4.x](https://godotengine.org). We develop the main interactive
   logic based on its bulit-in scripting capability.
2. The drawing tool. We use
   [Pixelorama](https://orama-interactive.itch.io/pixelorama) to draw
   pixel-art sprites and scenes.
3. The color style. We apply a 16 color palette,
   [Lost Century from Lospec.com](https://lospec.com/palette-list/lost-century).
   The palette gives a visualization style of old photos, which builds
   a feeling of looking back from future.

## Q & A

### Why do you use Godot, not industry standard like Unity or Unreal?

Fuzhou Chen, the initial developer of this project, recommends Godot as
main game engine. It's based on two reasons.

The first reason is simplicity. Based on Fuzhou's 16+ year experience of
programming, Godot is considered user-friendly to users who do not
have computer programming background. The built-in script (GDScript) of
Godot provide simple syntax for logic writing and interaction.
Meanwhile, industry standard systems typically use industry-level
programming languages, like C++ for Unreal and C# for Unity. Comparing
with Godot, they requires more knowledge of software development.
I expect our audiences, typically designers, can minimize
their prerequisites before focusing on their own work.

The second reason is license. Unity and Unreal are proprietary software
for commercial use. They may be fine when starting for study purpose.
However, the applied license may change when moving to business world.
Godot, on the other hand, is Open Source software. It does not restrict
use of educational or industry use.

I agree, that Godot has way less features comparing with Unity or
Unreal. However, it should not be a deal breaker. This project, which is
an interactive course, does not require advanced features provided by
industry game engine.

### Why do you use pixel arts instead of 3D?

The project sets a goal that we can offer designers sufficient
capabilities to develop interactive scene by their own. Thus, we expect
audiences use only skills that can be adopted by an individual.

3D visualization, though widely used in industry to present concept of
world-in-future, requires professional knowledge of computer graphics,
as well as corresponding industry tools like Maya, 3D Max, etc. None of
the tools can be quickly learned within a couple of hours.

Pixel art is known to be one of the visualization approach, which can
meet a good-enough visualization requirement with lowest entry level
skill. This project includes assets that built with 16x16 pixel art
pictures, which can be easily modified with simple tooling.

We agree, that when designers have successfully built a professional
team with strong graphic experts, we surely need to consider 3D.
However, since we have assumed our audiences do not have such resources,
a 2D pixel art visualization should be reasonable choice for our goal.
