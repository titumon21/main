    <!-- footer -->
        <footer class="w3l-footer-16">
            <div class="w3l-footer-16-main">
                <div class="container">
                    <div class="row footer-p">
                        <div class="col-lg-8 mt-lg-0 mt-4 pr-lg-5">
                            <div class="d-sm-flex align-items-center top-footer-content mb-5">
                                <a class="logo d-flex align-items-center" href="index.html"><i
                                        class="fab fa-accusoft icon-color mr-1"></i>AUTON<span></span></a>
                                <p class="top-p ml-sm-4 pl-sm-4 mt-sm-0 mt-2"></p>
                            </div>
                            <div class="row footer-grids pt-4">
                                <div class="col-sm-4 col-6 column">
                                    <ul class="footer-gd-16">
                                        <li><a href="index.html"><i class="fa fa-angle-right"
                                                                    aria-hidden="true"></i>Home</a></li>
                                        <li><a href="about.html"><i class="fa fa-angle-right" aria-hidden="true"></i>About
                                                Us</a></li>
                                        <li><a href="#services"><i class="fa fa-angle-right"
                                                                   aria-hidden="true"></i>Services</a></li>
                                        <li><a href="#blog"><i class="fa fa-angle-right" aria-hidden="true"></i>Blog
                                                Posts</a></li>
                                        <li><a href="contact.html"><i class="fa fa-angle-right"
                                                                      aria-hidden="true"></i>Contact Us</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4 col-6 column pl-sm-0">
                                    <ul class="footer-gd-16">
                                        <li><a href="#marketplace"><i class="fa fa-angle-right"
                                                                      aria-hidden="true"></i>Marketplace</a></li>
                                        <li><a href="#experts"><i class="fa fa-angle-right" aria-hidden="true"></i>Our
                                                Experts</a></li>
                                        <li><a href="#customers"><i class="fa fa-angle-right"
                                                                    aria-hidden="true"></i>Customers</a></li>
                                        <li><a href="#platform"><i class="fa fa-angle-right"
                                                                   aria-hidden="true"></i>Platform</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-4 col-6 column pl-sm-0">
                                    <ul class="footer-gd-16">
                                        <li><a href="#support"><i class="fa fa-angle-right"
                                                                  aria-hidden="true"></i>Support</a></li>
                                        <li><a href="#privacy"><i class="fa fa-angle-right" aria-hidden="true"></i>Privacy
                                                Policy</a></li>
                                        <li><a href="#terms"><i class="fa fa-angle-right" aria-hidden="true"></i>Terms &
                                                conditions</a></li>
                                        <li><a href="#faq"><i class="fa fa-angle-right" aria-hidden="true"></i>FAQ</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-7 column mt-lg-0 mt-4">
                            <h3>Newsletter </h3>
                            <div class="end-column">
                                <form action="#" class="subscribe" method="post">
                                    <input type="email" name="email" placeholder="Email Address" required="">
                                    <button class="button-style"><span class="fa fa-paper-plane"
                                                                       aria-hidden="true"></span></button>
                                </form>
                                <p>Subscribe to our mailing list and get updates to your email inbox.</p>
                            </div>
                            <div class="columns-2 mt-4">
                                <ul class="social">
                                    <li><a href="#facebook"><span class="fab fa-facebook-f" aria-hidden="true"></span></a>
                                    </li>
                                    <li><a href="#twitter"><span class="fab fa-twitter" aria-hidden="true"></span></a>
                                    </li>
                                    <li><a href="#google-plus"><span class="fab fa-google-plus-g"
                                                                     aria-hidden="true"></span></a>
                                    </li>
                                    <li><a href="#instagram"><span class="fab fa-instagram" aria-hidden="true"></span></a>
                                    </li>
                                    <li><a href="#linkedin"><span class="fab fa-linkedin-in" aria-hidden="true"></span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="below-section mt-5 text-center">
                        <p class="copy-text">@ 2021 Setup. All rights reserved. Design by <a href="http://www.lcckochi.com/"
                                                                                             target="_blank">
                                LCC</a>
                        </p>
                    </div>
                </div>
            </div>
        </footer>
        <!-- //footer -->

        <!-- Js scripts -->
        <!-- move top -->
        <button onclick="topFunction()" id="movetop" title="Go to top">
            <span class="fas fa-level-up-alt" aria-hidden="true"></span>
        </button>
        <script>
            // When the user scrolls down 20px from the top of the document, show the button
            window.onscroll = function () {
                scrollFunction()
            };

            function scrollFunction() {
                if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                    document.getElementById("movetop").style.display = "block";
                } else {
                    document.getElementById("movetop").style.display = "none";
                }
            }

            // When the user clicks on the button, scroll to the top of the document
            function topFunction() {
                document.body.scrollTop = 0;
                document.documentElement.scrollTop = 0;
            }
        </script>
        <!-- //move top -->

        <!-- common jquery plugin -->
        <script src="assets/js/jquery-3.3.1.min.js"></script>
        <!-- //common jquery plugin -->

        <!-- banner image moving effect -->
        <script>
            var lFollowX = 0,
                    lFollowY = 0,
                    x = 0,
                    y = 0,
                    friction = 1 / 30;

            function animate() {
                x += (lFollowX - x) * friction;
                y += (lFollowY - y) * friction;

                translate = 'translate(' + x + 'px, ' + y + 'px) scale(1.1)';

                $('.banner-image').css({
                    '-webit-transform': translate,
                    '-moz-transform': translate,
                    'transform': translate
                });

                window.requestAnimationFrame(animate);
            }

            $(window).on('mousemove click', function (e) {

                var lMouseX = Math.max(-100, Math.min(100, $(window).width() / 2 - e.clientX));
                var lMouseY = Math.max(-100, Math.min(100, $(window).height() / 2 - e.clientY));
                lFollowX = (20 * lMouseX) / 100; // 100 : 12 = lMouxeX : lFollow
                lFollowY = (10 * lMouseY) / 100;

            });

            animate();
        </script>
        <!-- //banner image moving effect -->

        <!-- typig-text-->
        <script>
            const typedTextSpan = document.querySelector(".typed-text");
            const cursorSpan = document.querySelector(".cursor");

            const textArray = ["Designer's", "Developer's", "Creator's"];
            const typingDelay = 300;
            const erasingDelay = 10;
            const newTextDelay = 100; // Delay between current and next text
            let textArrayIndex = 0;
            let charIndex = 0;

            function type() {
                if (charIndex < textArray[textArrayIndex].length) {
                    if (!cursorSpan.classList.contains("typing"))
                        cursorSpan.classList.add("typing");
                    typedTextSpan.textContent += textArray[textArrayIndex].charAt(charIndex);
                    charIndex++;
                    setTimeout(type, typingDelay);
                } else {
                    cursorSpan.classList.remove("typing");
                    setTimeout(erase, newTextDelay);
                }
            }

            function erase() {
                if (charIndex > 0) {
                    // add class 'typing' if there's none
                    if (!cursorSpan.classList.contains("typing")) {
                        cursorSpan.classList.add("typing");
                    }
                    typedTextSpan.textContent = textArray[textArrayIndex].substring(0, 0);
                    charIndex--;
                    setTimeout(erase, erasingDelay);
                } else {
                    cursorSpan.classList.remove("typing");
                    textArrayIndex++;
                    if (textArrayIndex >= textArray.length)
                        textArrayIndex = 0;
                    setTimeout(type, typingDelay);
                }
            }

            document.addEventListener("DOMContentLoaded", function () { // On DOM Load initiate the effect
                if (textArray.length)
                    setTimeout(type, newTextDelay + 250);
            });
        </script>
        <!-- //typig-text-->

        <!-- owl carousel -->
        <script src="assets/js/owl.carousel.js"></script>
        <!-- script for tesimonials carousel slider -->
        <script>
            $(document).ready(function () {
                $("#owl-demo2").owlCarousel({
                    loop: true,
                    nav: false,
                    margin: 50,
                    responsiveClass: true,
                    autoplay: true,
                    autoplayTimeout: 5000,
                    autoplaySpeed: 1000,
                    autoplayHoverPause: true,
                    responsive: {
                        0: {
                            items: 1,
                            nav: false
                        },
                        736: {
                            items: 1,
                            nav: false
                        },
                        991: {
                            items: 2,
                            margin: 30,
                            nav: false
                        },
                        1080: {
                            items: 3,
                            nav: false
                        }
                    }
                })
            })
        </script>
        <!-- //script for tesimonials carousel slider -->
        <!-- //owl carousel -->

        <!-- theme switch js (light and dark)-->
        <script src="assets/js/theme-change.js"></script>
        <script>
            function autoType(elementClass, typingSpeed) {
                var thhis = $(elementClass);
                thhis.css({
                    "position": "relative",
                    "display": "inline-block"
                });
                thhis.prepend('<div class="cursor" style="right: initial; left:0;"></div>');
                thhis = thhis.find(".text-js");
                var text = thhis.text().trim().split('');
                var amntOfChars = text.length;
                var newString = "";
                thhis.text("|");
                setTimeout(function () {
                    thhis.css("opacity", 1);
                    thhis.prev().removeAttr("style");
                    thhis.text("");
                    for (var i = 0; i < amntOfChars; i++) {
                        (function (i, char) {
                            setTimeout(function () {
                                newString += char;
                                thhis.text(newString);
                            }, i * typingSpeed);
                        })(i + 1, text[i]);
                    }
                }, 1500);
            }

            $(document).ready(function () {
                // Now to start autoTyping just call the autoType function with the 
                // class of outer div
                // The second paramter is the speed between each letter is typed.   
                autoType(".type-js", 200);
            });
        </script>
        <!-- //theme switch js (light and dark)-->

        <!-- magnific popup -->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.popup-with-zoom-anim').magnificPopup({
                    type: 'inline',

                    fixedContentPos: false,
                    fixedBgPos: true,

                    overflowY: 'auto',

                    closeBtnInside: true,
                    preloader: false,

                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
                });

                $('.popup-with-move-anim').magnificPopup({
                    type: 'inline',

                    fixedContentPos: false,
                    fixedBgPos: true,

                    overflowY: 'auto',

                    closeBtnInside: true,
                    preloader: false,

                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-slide-bottom'
                });
            });
        </script>
        <!-- //magnific popup -->

        <!-- MENU-JS -->
        <script>
            $(window).on("scroll", function () {
                var scroll = $(window).scrollTop();

                if (scroll >= 80) {
                    $("#site-header").addClass("nav-fixed");
                } else {
                    $("#site-header").removeClass("nav-fixed");
                }
            });

            //Main navigation Active Class Add Remove
            $(".navbar-toggler").on("click", function () {
                $("header").toggleClass("active");
            });
            $(document).on("ready", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
                $(window).on("resize", function () {
                    if ($(window).width() > 991) {
                        $("header").removeClass("active");
                    }
                });
            });
        </script>
        <!-- //MENU-JS -->

        <!-- disable body scroll which navbar is in active -->
        <script>
            $(function () {
                $('.navbar-toggler').click(function () {
                    $('body').toggleClass('noscroll');
                })
            });
        </script>
        <!-- //disable body scroll which navbar is in active -->

        <!--bootstrap-->
        <script src="assets/js/bootstrap.min.js"></script>
        <!-- //bootstrap-->
        <!-- //Js scripts -->
    </body>

</html>