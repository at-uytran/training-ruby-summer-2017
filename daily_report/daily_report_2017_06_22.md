
# Day 22-06-2017

----------

[TOC]

## CSS



### container
Container is a class to contain elements.
To display container by block, use display: block;

```css
.container{
	display: block;
}
```

### width change by browser transform
width of an element can change when user zoom in or zoom out when we use the method after
```css
{
	width: calc(100%-20px);
}

```
if the width of user's screen is 900px, this css will make content's width become 880px

### clear
between 2 elements, if not have clear attribute, they will be too close
```css
/*clear: direction*/
clear: left;
clear: right;
clear: bottom;
clear:top;

```
### Position
When we want to located a element by position.
```css
{
	position: fixed;
	
}
```


#### fixed position
the element if have this property will not move out of screen when user scroll on website
```css
.classname{
	position:fixed;
}
```
####  absolute position
If we use this property, the element will get out of the closure element to the browser
```css
.classname{
	position:absolute;
}
```
#### relative position
like we call it, this property will keep it on the bigger element when we show on browser


```css
.classname{
	position:relative;
}
```
