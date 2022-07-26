@extends('layouts.layout')

@section('title')
    subject
@endsection

@section('main_content')
    <style>
        #grid {
            display: grid;
            grid-template-columns:repeat(auto-fill, minmax(25%, 1fr));
            /*align-self: center;*/
            /*grid-template-columns: 1fr 1fr 1fr;*/
            /*grid-gap: 2vw;*/
            /*background-color: #95999c;*/
        }

        #grid > img {
            font-size: 1.1vw;
            /*padding: .5em;*/
            /*margin: .05em;*/
            background: white;
            /*box-shadow: 0 0 0 1px darkgrey;*/
            /*align-self: center;*/
        }
    </style>
    <div class="container dark-grey-text mt-0">
        <div class="card">
            <div class="col-12 mb-xl-5 display-6">
                {{ $product->title }}
            </div>
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->

                <div class="col-6">
                    <div class="row col-12 m-2 align-items-center one ml-4" style="overflow: hidden; height: 400px;">
                        <img src="{{asset('storage/'.$product->image)}}"
                             alt="Main image" style="width: 80%; height: 80%; object-fit: contain; justify-content: center;">
                    </div>


{{--                    <div id="carousel-example-2" class="carousel slide carousel-fade mb-3" data-ride="carousel">--}}
{{--                        <!--Indicators-->--}}
{{--                        <ol class="carousel-indicators">--}}
{{--                            <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>--}}
{{--                            <li data-target="#carousel-example-2" data-slide-to="1"></li>--}}
{{--                            <li data-target="#carousel-example-2" data-slide-to="2"></li>--}}
{{--                            <li data-target="#carousel-example-2" data-slide-to="3"></li>--}}
{{--                        </ol>--}}
{{--                        <!--/.Indicators-->--}}
{{--                        <!--Slides-->--}}
{{--                        <div class="carousel-inner" role="listbox">--}}
{{--                            <div class="carousel-item active">--}}
{{--                                <div class="view">--}}
{{--                                    <img class="d-block w-100" src="{{asset('images/1.jpg')}}"--}}
{{--                                         alt="First slide" style="max-height: 400px">--}}
{{--                                    <div class="mask rgba-black-light"></div>--}}
{{--                                </div>--}}
{{--                                <div class="carousel-caption">--}}
{{--                                    <h3 class="h3-responsive">Light mask</h3>--}}
{{--                                    <p>First text</p>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="carousel-item">--}}
{{--                                <!--Mask color-->--}}
{{--                                <div class="view">--}}
{{--                                    <img class="d-block w-100" src="{{asset('images/2.jpg')}}"--}}
{{--                                         alt="Second slide" style="max-height: 400px">--}}
{{--                                    <div class="mask rgba-black-strong"></div>--}}
{{--                                </div>--}}
{{--                                <div class="carousel-caption">--}}
{{--                                    <h3 class="h3-responsive">Strong mask</h3>--}}
{{--                                    <p>Secondary text</p>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="carousel-item">--}}
{{--                                <!--Mask color-->--}}
{{--                                <div class="view">--}}
{{--                                    <img class="d-block w-100" src="{{asset('images/3.jpg')}}"--}}
{{--                                         alt="Second slide" style="max-height: 400px">--}}
{{--                                    <div class="mask rgba-black-strong"></div>--}}
{{--                                </div>--}}
{{--                                <div class="carousel-caption">--}}
{{--                                    <h3 class="h3-responsive">Strong mask</h3>--}}
{{--                                    <p>Secondary text</p>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                            <div class="carousel-item">--}}
{{--                                <!--Mask color-->--}}
{{--                                <div class="view">--}}
{{--                                    <img class="d-block w-100" src="{{asset('images/4.jpg')}}"--}}
{{--                                         alt="Second slide" style="max-height: 400px">--}}
{{--                                    <div class="mask rgba-black-strong"></div>--}}
{{--                                </div>--}}
{{--                                <div class="carousel-caption">--}}
{{--                                    <h3 class="h3-responsive">Strong mask</h3>--}}
{{--                                    <p>Secondary text</p>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                        <!--/.Slides-->--}}
{{--                        <!--Controls-->--}}
{{--                        <a class="carousel-control-prev" href="#carousel-example-2" role="button" data-slide="prev">--}}
{{--                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>--}}
{{--                            <span class="sr-only">Previous</span>--}}
{{--                        </a>--}}
{{--                        <a class="carousel-control-next" href="#carousel-example-2" role="button" data-slide="next">--}}
{{--                            <span class="carousel-control-next-icon" aria-hidden="true"></span>--}}
{{--                            <span class="sr-only">Next</span>--}}
{{--                        </a>--}}
{{--                        <!--/.Controls-->--}}
{{--                    </div>--}}





{{--                    <div class="d-flex flex-row justify-content-around m-2" style="height: 80px; cursor: pointer;">--}}
                    <div id="grid" style="cursor: pointer; margin-left: 20px;">
                        @foreach($image as $img)
                                <img class="many p-2" src="{{asset('storage/'.$img->photos)}}" height="80%" width="80%"
                                     alt="image">
                        @endforeach
                    </div>
{{--                    </div>--}}
                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-md-6 mb-4">
                    <div class="">
                        <div class="mb-3">
                            <a class="d-flex justify-content-start mt-4" href="{{ route('category.show',['id' => $product->category_id]) }}">
                      <span class="col-3 text-lg badge
                    @if ($product->category->id == 1)
                          badge-primary
                    @elseif($product->category->id == 2)
                          badge-secondary
                    @elseif($product->category->id == 3)
                          badge-success
                    @elseif($product->category->id == 4)
                          badge-lime
                    @endif
                          ">{{ $product->category->name}}
                    </span>
                            </a>
                        </div>
                        <p class="lead">
                            <span class="mr-1"></span>
                            <span>₴{{ $product->price }}</span>
                        </p>
                        <p class="lead font-weight-bold">Description</p>
                        <p>
                            {{ Str::limit($product->description, 190, ' (...)') }}
                        </p>

                        <p class="lead font-weight-bold">Manufactur</p>
                        <p>
                            {{ $product->manufactur->name}} - {{ $product->manufactur->country}}
                        </p>
                    </div>
                    <!--Content-->

                </div>
                <!--Grid column-->

            </div>
            <!--Grid row-->

            <hr>

            <!--Grid row-->
            <div class="row d-flex justify-content-center">

                <!--Grid column-->
                <div class="col-md-6 text-center">

                    <h4 class="my-4 h4">Additional information</h4>

                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Natus suscipit modi sapiente illo soluta
                        odit voluptates,
                        quibusdam officia. Neque quibusdam quas a quis porro? Molestias illo neque eum in laborum.</p>

                </div>
            </div>
            <div class="row">

                <!--Grid column-->
                <div class="col-lg-4 col-md-12 mb-4">

                    <img src="{{asset('images/product_footer_1.jpg')}}" class="img-fluid"
                         alt="">

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-4">

                    <img src="{{asset('images/product_footer_2.jpg')}}" class="img-fluid"
                         alt="">

                </div>
                <!--Grid column-->

                <!--Grid column-->
                <div class="col-lg-4 col-md-6 mb-4">

                    <img src="{{asset('images/product_footer_3.jpg')}}" class="img-fluid"
                         alt="">
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            const one = document.querySelector('.one');
            let div = document.querySelectorAll(".many");
            div.forEach(n => {
                addEventListener("click", function (e) {
                    if (e.target.src) {
                        div.forEach(n => {
                            n.style.border = 'none';
                        });
                        e.target.style = 'border:1px solid green';
                        const action = e.target.src;
                        const img = new Image();
                        img.src = action;
                        img.style = 'width: 80%; height: 80%; object-fit: contain;';
                        one.innerHTML = '';
                        one.append(img);
                    }
                });
            });
        });
    </script>
@endsection