library(grid)
library(Gmisc)

grid.newpage()
# set some parameters to use repeatedly
center <-.3
leftx <- .25
midx <- .5
rightx <- .8
width_upper <- .2
width_low <- .125
height <-.1
gp <- gpar(fill = "lightgrey")
# create boxes
(total <- boxGrob("KNHANES 2007-2015\n (N = 73,353)", x=center, y=.9, box_gp = gp, width = width_upper))

(ro_age <- boxGrob("Age<20\n (N = 17,969)", x=.7, y=.825, box_gp = gp))

(age <- boxGrob("Age>=20\n (N = 55,384)", x=center, y=.75, box_gp=gp, width=width_upper))

(smoking <- boxGrob("Known smoking Hx\n (N = 50,458)", x=center, y=.6, box_gp = gp, width = width_upper))

(unknown_smoking <- boxGrob("Unknown smoking Hx\n (N = 4,926)", x=.7, y=.675, box_gp = gp))

# connect boxes like this
connectGrob(total, age, "v")
connectGrob(total, ro_age, "-")
connectGrob(age, smoking, "v")
connectGrob(age, unknown_smoking, "-")

(current <- boxGrob("Current smoker\n (N = 10,245)", x=.15, y=.45, box_gp = gp, width =width_low))
(ex <- boxGrob("Ex smoker\n (N = 9,089)", x=center, y=.45, box_gp = gp, width =width_low))
(never <- boxGrob("Never smoker\n (N = 31,124)", x=.45, y=.45, box_gp = gp, width = width_low))
 
connectGrob(smoking, current, "v")
connectGrob(smoking, ex, "v")
connectGrob(smoking, never, "v")

(shs <- boxGrob("Known SHS Hx\n (N = 30,744)", x=.45, y=.3, box_gp = gp, width = width_upper))

(shs_po <- boxGrob("SHS (+)\n (N = 9,129)", x=.375, y=.15, box_gp = gp, width = width_low))
(shs_ne <- boxGrob("SHS (-)\n (N = 21,615)", x=.525, y=.15, box_gp = gp, width = width_low))

connectGrob(never, shs, "v")
connectGrob(shs, shs_po, "v")
connectGrob(shs, shs_ne, "v")
 
(unknown_shs <- boxGrob("Unknown SHS Hx\n (N = 380)", x=.7, y=.375, box_gp = gp))

connectGrob(never, unknown_shs, "-")
