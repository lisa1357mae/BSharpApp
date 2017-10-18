def new
	@review = Review.new
end

def create
	@review = Review.new(review_params)

	if @review.save
		redirect_to event_path(@event)
	else
		render 'new'
	end
end
