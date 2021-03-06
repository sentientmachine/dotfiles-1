```css
A selector designates exactly which element or elements within our HTML to target
and apply styles (such as color, size, and position) to.

    p { ... }

A property determines the styles that will be applied to that element.

    p {
      color: ...;
      font-size: ...;
    }

Values. We can determine the behavior of a property with a value. Values can be
identified as the text between the colon, :, and semicolon, ;.

    p {
      color: orange;
      font-size: 16px;
    }

/* Specificity Weights: */
id: 1-0-0
class: 0-1-0
type: 0-0-1

IMPORTANT NOTE:
The ID selector has a higher specificity weight than the class selector, and the
class selector has a higher specificity weight than the type selector.

The higher the specificity weight of a selector, the more superiority the selector
is given when a styling conflict occurs. For example, if a paragraph element is
selected using a type selector in one place and an ID selector in another, the ID
selector will take precedence over the type selector regardless of where the ID
selector appears in the cascade.

/* Width */
The default width of an element depends on its display value. Block-level elements
have a default width of 100%, consuming the entire horizontal space available.
Inline and inline-block elements expand and contract horizontally to accommodate
their content. Inline-level elements cannot have a fixed size, thus the width and
height properties are only relevant to non-inline elements. To set a specific
width for a non-inline element, use the width property.

/* Height */
The default height of an element is determined by its content. An element will
expand and contract vertically as necessary to accommodate its content. To set a
specific height for a non-inline element, use the height property.

/* Sizing Inline-Level Elements */
Please keep in mind that inline-level elements will not accept the width and height
properties or any values tied to them. Block and inline-block elements will,
however, accept the width and height properties and their corresponding values.

/* Margin */
The margin property allows us to set the amount of space that surrounds an element.
One oddity with the margin property is that vertical margins, top and bottom, are
not accepted by inline-level elements. These vertical margins are, however,
accepted by block-level and inline-block elements.

/* Padding */
The padding property is very similar to the margin property; however, it falls
inside of an element’s border, should an element have a border. The padding
property is used to provide spacing directly within an element.
The padding property, unlike the margin property, works vertically on inline-level
elements. This vertical padding may blend into the line above or below the given
element, but it will be displayed.

/* Margin & Padding on Inline-Level Elements */
Inline-level elements are affected a bit differently than block and inline-block
elements when it comes to margins and padding. Margins only work horizontally—left
and right—on inline-level elements. Padding works on all four sides of inline-level
elements; however, the vertical padding—the top and bottom—may bleed into the lines
above and below an element.
Margins and padding work like normal for block and inline-block elements.

/* Margin & Padding Declarations */
To set one value for the top and bottom and another value for the left and right
sides of an element, specify two values: top and bottom first, then left and right.
Here we are placing margins of 10 pixels on the top and bottom of a <div> and
margins of 20 pixels on the left and right:

div {
  margin: 10px 20px;
}

/* Margin & Padding Colors */
The margin and padding properties are completely transparent and do not accept
any color values. Being transparent, though, they show the background colors of
relative elements. For margins, we see the background color of the parent element,
and for padding, we see the background color of the element the padding is applied to.

/* Border-Radius */

The border-radius property accepts length units, including percentages and pixels,
that identify the radius by which the corners of an element are to be rounded. A
single value will round all four corners of an element equally; two values will
round the top-left/bottom-right and top-right/bottom-left corners in that order;
four values will round the top-left, top-right, bottom-right, and bottom-left
corners in that order.
When considering the order in which multiple values are applied to the border-radius
property (as well as the margin and padding properties), remember that they move
in a clockwise fashion starting at the top left of an element.

/* Web-Safe Fonts */

Arial                                Courier New, Courier
Garamond                             Georgia
Lucida Sans, Lucida Grande, Lucida   Palatino Linotype
Tahoma                               Times New Roman, Times
Trebuchet                            Verdana

Embedded web fonts must be surrounded by quotes.

/* Background Position */

The background-position property requires two values: a horizontal offset
(the first value) and a vertical offset (the second value). If only one
value is specified, that value is used for the horizontal offset and the
vertical offset will default to 50%.
```
