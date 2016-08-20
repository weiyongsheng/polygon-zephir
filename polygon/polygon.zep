namespace Polygon;

class Polygon
{
    private points = [];

    private valid = false;

    public function __construct(array points = []){
        if empty points {
            let this->valid = false;
        }else{
            this->setPoints(points);
        }
    }

    public function setPoints(array points){
        let this->valid = false;
        int count = count(points);

        if count >= 3{
            let this->valid = true;
            var point;
            for point in points {
                if !this->checkPoint(point) {
                    let this->valid = false;

                    return this;
                }
            }
        } else {
            return this;
        }
        let this->points = points;

        return this;
    }

    /**
     * @return []
     */
    public function getPoints()
    {
        return this->points;
    }

    /**
     * @return bool
     */
    public function isValid()
    {
        return this->valid;
    }

    /**
     * @param double lat
     * @param double lng
     *
     * @return bool
     */
    public function isContainPoint(lat, lng)
    {
        int count = 0;
        var  points = this->points;
        let points[] = reset(points);
        var point1 = reset(points);
        var point2;

        while (true) {
            let point2 = next(points);
            if empty point2{
                break;
            }

            var x1 = point1[0];
            var y1 = point1[1];
            var x2 = point2[0];
            var y2 = point2[1];
            if (lat >= min(x1, x2) && lat <= max(x1, x2) && x1 != x2) {
                var tmp;
                let tmp = y1 + (lat - x1) / (x2 - x1) * (y2 - y1);
                if (tmp < lng) {
                    let count = count + 1;
                } elseif (tmp == lng) {
                    return true;
                }
            }
            let point1 = point2;
        }

        return count % 2 === 1;
    }

    private function checkPoint(array point){
        return is_array(point) && count(point) == 2 && is_numeric(point[0]) && is_numeric(point[1]);
    }
}
