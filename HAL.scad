$fn = 72;



steelColor = [224/255, 223/255, 219/255];



edgeThickness = 3.175;
width = 120;
height = 366.67;
grillHeight = 73.33;
lensOffset = 153.33;
labelOffset = height - (edgeThickness + 8);
plateThickness = 3;
thickness = 75;
plateOffset = thickness - 5;
nozzleFudge = 0.4;


//translate([0, lensOffset, plateOffset + plateThickness + 3])
//button();

/*
translate([0, edgeThickness, plateOffset])
grill();
*/

/*
intersection()
{
    difference()
    {
        translate([0, grillHeight + (edgeThickness * 2), plateOffset])
        plate();
        
        union()
        {
            translate([0, lensOffset, 6.25])
            buttonMask();
            
            translate([0, labelOffset, plateOffset + plateThickness])
            label();
        }
    }
    
    translate([0, 80 + edgeThickness*2 + grillHeight + 140, 0])
    cube([200, 160, 200], center=true);
}
*/

//translate([0, labelOffset, plateOffset + plateThickness])
//label();

/*
translate([0, edgeThickness/2, 0])
difference()
{
    edgeWidth = width - (edgeThickness * 2);
    supportHeight = plateOffset + nozzleFudge;
    
    rotate([90, 0, 0])
    horizontalEdge(holeWidth = 16);
    
    union()
    {
        translate([-(edgeThickness + nozzleFudge)/2 + edgeWidth/2, -supportHeight/2, edgeThickness/2 - nozzleFudge*1.5/2])
        cube([edgeThickness + nozzleFudge, supportHeight, nozzleFudge*1.5 + .01], center=true);
        
        translate([-(-(edgeThickness + nozzleFudge)/2 + edgeWidth/2), -supportHeight/2, edgeThickness/2 - nozzleFudge*1.5/2])
        cube([edgeThickness + nozzleFudge, supportHeight, nozzleFudge*1.5 + .01], center=true);
        
        
        translate([-(-(edgeThickness + nozzleFudge)/2 + edgeWidth/2), -supportHeight/2, -edgeThickness/2 + nozzleFudge/2])
        cube([edgeThickness + nozzleFudge, supportHeight, nozzleFudge], center=true);
        
        translate([(-(edgeThickness + nozzleFudge)/2 + edgeWidth/2), -supportHeight/2, -edgeThickness/2 + nozzleFudge/2])
        cube([edgeThickness + nozzleFudge, supportHeight, nozzleFudge], center=true);
        
        
    }
}
*/

//translate([0, 3*edgeThickness/2 + grillHeight, 0])
//horizontalEdge();
//translate([0, height - edgeThickness/2, 0])
//horizontalEdge();

/*
intersection()
{
    union()
    {
        translate([-(width/2 - edgeThickness/2), height/2, 0])
        verticalEdge();

        mirror()
        {
            translate([-(width/2 - edgeThickness/2), height/2, 0])
            verticalEdge();
        }
    }
    
    translate([0, 375, 0])
    cube([200, 150, 200], center=true);
}
*/

corner();
module corner()
{
    difference()
    {
        rotate([45, 0, 0])
        cube([edgeThickness, 50, 50], center=true);
        
        union()
        {
            translate([0, 0, -50])
            cube([100, 100, 100], center=true);
            
            translate([0, 0, 50 + 25])
            cube([100, 100, 100], center=true);
        }
    }
}


module button()
{
    buttonDiameter = 87.8;
    bezelStartDiameter = 98.5;
    bezelEndDiameter = 92;
    bezelHeight = 6.5;
    
    union()
    {
        color("black")
        cylinder(d=buttonDiameter, h=10, center=true);
        
        scale([1, 1, .5])
        difference()
        {
            color("red")
            sphere(d=buttonDiameter, center=true);
            
            translate([0, 0, -75])
            cube([150, 150, 150], center=true);
        }
        
        cylinder(d1=bezelStartDiameter, d2=bezelEndDiameter, h=bezelHeight, center=true);
    }
}

module buttonMask()
{
    buttonDiameter = 87.8;
    notchRadius = 3;
    cylinder(d=buttonDiameter + nozzleFudge, h=50, center=true);
    
    translate([0, buttonDiameter/2, 0])
    cylinder(r=notchRadius + nozzleFudge, h=50, center=true);
    
    translate([0, -buttonDiameter/2, 0])
    cylinder(r=notchRadius + nozzleFudge, h=50, center=true);
}

module horizontalEdge(holeWidth)
{
    edgeWidth = width - (edgeThickness * 2);
    edgeLength = edgeThickness;
    edgeHeight = thickness;
    
    color(steelColor)
    translate([0, 0, edgeHeight/2])
    difference()
    {
        cube([edgeWidth, edgeLength, edgeHeight], center=true);
        
        rotate([90, 0, 0])
        cylinder(d=holeWidth, h=edgeThickness*2, center=true);
    }
}

module verticalEdge()
{
    edgeWidth = edgeThickness;
    edgeLength = height;
    edgeHeight = thickness;
    
    supportHeight = plateOffset;
    
    color(steelColor)
    translate([0, 0, edgeHeight/2])
    cube([edgeWidth, edgeLength, edgeHeight], center=true);
        
    // Supports for assembly
    translate([edgeThickness, 3*edgeThickness/2 - edgeLength/2, supportHeight/2])
    cube([edgeThickness, edgeThickness, supportHeight], center=true);
    
    translate([edgeThickness, edgeThickness/2 - edgeLength/2 + grillHeight, supportHeight/2])
    cube([edgeThickness, edgeThickness, supportHeight], center=true);
    
    translate([edgeThickness, 5*edgeThickness/2 - edgeLength/2 + grillHeight, supportHeight/2])
    cube([edgeThickness, edgeThickness, supportHeight], center=true);
    
    translate([edgeThickness, 0, supportHeight/2])
    cube([edgeThickness, edgeThickness, supportHeight], center=true);
    
    translate([edgeThickness, edgeLength/4, supportHeight/2])
    cube([edgeThickness, edgeThickness, supportHeight], center=true);
    
    translate([edgeThickness, -3*edgeThickness/2 + edgeLength/2, supportHeight/2])
    cube([edgeThickness, edgeThickness, supportHeight], center=true);
}

module grill()
{
    numX = 22;
    numY = 18;
    xRange = (numX - 1) / 2;
    yRange = (numY - 1) / 2;
    holeWidth = 2;
    spacingX = 5;
    spacingY = 4;
    
    grillWidth = width - (edgeThickness * 2);
    
    difference()
    {
        color(steelColor)
        translate([0, grillHeight/2, 1.5])
        cube([grillWidth, grillHeight, plateThickness], center=true);
        
        color(steelColor)
        translate([0, grillHeight/2, 1.5])
        for (y = [-yRange:1:yRange])
        {
            render()
            for (x = [-xRange:1:xRange])
            {
                //render()
                translate([x * spacingX, y * spacingY, 0])
                cylinder(d=holeWidth, h=5, center=true);
            }
        } 
    }
}

module plate()
{
    plateHeight = height - (grillHeight + (edgeThickness * 3));
    plateWidth = width - (edgeThickness * 2);
    
    color("black")
    translate([0, plateHeight/2, 1.5])
    cube([plateWidth, plateHeight, plateThickness], center=true);
}

module label()
{
    labelWidth = 92.5;
    labelHeight = 18.5;
    labelThickness = .25;
    
    color("turquoise")
    translate([0, -labelHeight/2, -labelThickness/2])
    cube([labelWidth, labelHeight, labelThickness], center=true);
}
