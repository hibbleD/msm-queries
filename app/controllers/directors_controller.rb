class DirectorsController < ApplicationController
  def index
    render({:template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({:id => the_id})
    @the_director = matching_records.at(0)
    render({:template => "director_templates/details"})
  end 

  def eldest

    @matching_records = Director.minimum(:dob)

    @the_eldest = Director.where({:dob => @matching_records}).at(0).name

  

  
    render({:template => "director_templates/eldest"})
  end

  def youngest
    @matching_records = Director.maximum(:dob)

    @the_youngest = Director.where({:dob => @matching_records}).at(0).name

    render({:template => "director_templates/youngest"})
  end
end

  
