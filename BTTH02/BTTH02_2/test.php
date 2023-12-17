<?php

class test
{
    //Properties
    private $id;
    private $fullname;
    private $dateOfBorned;
    private $school = "TLU";

    /**
     * @param $fullname
     * @param $dateOfBorned
     * @param string $school
     */
    public function __construct($fullname, $dateOfBorned, $school)
    {
        $this->fullname = $fullname;
        $this->dateOfBorned = $dateOfBorned;
        $this->school = $school;
    }

    /**
     * @return mixed
     */
    public function getFullname()
    {
        return $this->fullname;
    }

    /**
     * @param mixed $fullname
     */
    public function setFullname($fullname)
    {
        $this->fullname = $fullname;
    }

    /**
     * @return mixed
     */
    public function getDateOfBorned()
    {
        return $this->dateOfBorned;
    }

    /**
     * @param mixed $dateOfBorned
     */
    public function setDateOfBorned($dateOfBorned)
    {
        $this->dateOfBorned = $dateOfBorned;
    }

    /**
     * @return string
     */
    public function getSchool()
    {
        return $this->school;
    }

    /**
     * @param string $school
     */
    public function setSchool($school)
    {
        $this->school = $school;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }



}