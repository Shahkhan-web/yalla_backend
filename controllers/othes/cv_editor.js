const { use_db } = require("../../config/db_pool");
const update_marital_status = async (req, res) => {
  let data = await req.body;
  try {
    const update = await marital_status(data);
    res.status(update.status).json(update);
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};

const marital_status = async (data) => {
  const mutate_data = data.map((i) => {
    return `('${i}')`;
  });
  let query = `insert into teacher_options (marital_status) values`;
  const sql = query + mutate_data.toString();
  const update_data = await use_db(`${sql}`).then((data) => {
    console.log(data);
    if (data.command === "INSERT") {
      return { status: 200, result: "success" };
    } else {
      return { status: 401 };
    }
  });
  return update_data;
};
const update_teaching_exp = async (req, res) => {
  let data = await req.body;
  try {
    const update = await teaching_exp(data);
    res.status(update.status).json(update);
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};

const teaching_exp = async (data) => {
  const mutate_data = data.map((i) => {
    return `('${i}')`;
  });
  let query = `insert into teacher_options (teaching_exp) values`;
  const sql = query + mutate_data.toString();
  const update_data = await use_db(`${sql}`).then((data) => {
    console.log(data);
    if (data.command === "INSERT") {
      return { status: 200, result: "success" };
    } else {
      return { status: 401 };
    }
  });
  return update_data;
};
const update_availibility = async (req, res) => {
  let data = await req.body;
  try {
    const update = await availibility(data);
    res.status(update.status).json(update);
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};

const availibility = async (data) => {
  const mutate_data = data.map((i) => {
    return `('${i}')`;
  });
  let query = `insert into teacher_options (availibility) values`;
  const sql = query + mutate_data.toString();
  const update_data = await use_db(`${sql}`).then((data) => {
    console.log(data);
    if (data.command === "INSERT") {
      return { status: 200, result: "success" };
    } else {
      return { status: 401 };
    }
  });
  return update_data;
};
const update_salary_expectations = async (req, res) => {
  let data = await req.body;
  try {
    const update = await salary_expectations(data);
    res.status(update.status).json(update);
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};

const salary_expectations = async (data) => {
  const mutate_data = data.map((i) => {
    return `('${i}')`;
  });
  let query = `insert into teacher_options (salary_expectations) values`;
  const sql = query + mutate_data.toString();
  const update_data = await use_db(`${sql}`).then((data) => {
    console.log(data);
    if (data.command === "INSERT") {
      return { status: 200, result: "success" };
    } else {
      return { status: 401 };
    }
  });
  return update_data;
};
const update_current_salary = async (req, res) => {
  let data = await req.body;
  try {
    const update = await current_salary(data);
    res.status(update.status).json(update);
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};

const current_salary = async (data) => {
  const mutate_data = data.map((i) => {
    return `('${i}')`;
  });
  let query = `insert into teacher_options (current_salary) values`;
  const sql = query + mutate_data.toString();
  const update_data = await use_db(`${sql}`).then((data) => {
    console.log(data);
    if (data.command === "INSERT") {
      return { status: 200, result: "success" };
    } else {
      return { status: 401 };
    }
  });
  return update_data;
};
const update_qualification = async (req, res) => {
  let data = await req.body;
  try {
    const update = await qualification(data);
    res.status(update.status).json(update);
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};

const qualification = async (data) => {
  const mutate_data = data.map((i) => {
    return `('${i}')`;
  });
  let query = `insert into teacher_options (qualification) values`;
  const sql = query + mutate_data.toString();
  const update_data = await use_db(`${sql}`).then((data) => {
    console.log(data);
    if (data.command === "INSERT") {
      return { status: 200, result: "success" };
    } else {
      return { status: 401 };
    }
  });
  return update_data;
};
const update_age_groups_taught = async (req, res) => {
  let data = await req.body;
  try {
    const update = await age_groups_taught(data);
    res.status(update.status).json(update);
    return;
  } catch (errr) {
    res.status(401).send(errr);
  }
  return;
};

const age_groups_taught = async (data) => {
  const mutate_data = data.map((i) => {
    return `('${i}')`;
  });
  let query = `insert into teacher_options (age_groups_taught) values`;
  const sql = query + mutate_data.toString();
  const update_data = await use_db(`${sql}`).then((data) => {
    console.log(data);
    if (data.command === "INSERT") {
      return { status: 200, result: "success" };
    } else {
      return { status: 401 };
    }
  });
  return update_data;
};
const update_subjects = async (req, res) => {
    let data = await req.body;
    try {
      const update = await subjects(data);
      res.status(update.status).json(update);
      return;
    } catch (errr) {
      res.status(401).send(errr);
    }
    return;
  };
  
  const subjects = async (data) => {
    const mutate_data = data.map((i) => {
      return `('${i}')`;
    });
    let query = `insert into teacher_options (subjects) values`;
    const sql = query + mutate_data.toString();
    const update_data = await use_db(`${sql}`).then((data) => {
      console.log(data);
      if (data.command === "INSERT") {
        return { status: 200, result: "success" };
      } else {
        return { status: 401 };
      }
    });
    return update_data;
  };
  const update_english = async (req, res) => {
    let data = await req.body;
    try {
      const update = await english(data);
      res.status(update.status).json(update);
      return;
    } catch (errr) {
      res.status(401).send(errr);
    }
    return;
  };
  
  const english = async (data) => {
    const mutate_data = data.map((i) => {
      return `('${i}')`;
    });
    let query = `insert into teacher_options (english) values`;
    const sql = query + mutate_data.toString();
    const update_data = await use_db(`${sql}`).then((data) => {
      console.log(data);
      if (data.command === "INSERT") {
        return { status: 200, result: "success" };
      } else {
        return { status: 401 };
      }
    });
    return update_data;
  };
  const update_curriclum = async (req, res) => {
    let data = await req.body;
    try {
      const update = await curriclum(data);
      res.status(update.status).json(update);
      return;
    } catch (errr) {
      res.status(401).send(errr);
    }
    return;
  };
  
  const curriclum = async (data) => {
    const mutate_data = data.map((i) => {
      return `('${i}')`;
    });
    let query = `insert into teacher_options (curriclum) values`;
    const sql = query + mutate_data.toString();
    const update_data = await use_db(`${sql}`).then((data) => {
      console.log(data);
      if (data.command === "INSERT") {
        return { status: 200, result: "success" };
      } else {
        return { status: 401 };
      }
    });
    return update_data;
  };
  const update_license = async (req, res) => {
    let data = await req.body;
    try {
      const update = await license(data);
      res.status(update.status).json(update);
      return;
    } catch (errr) {
      res.status(401).send(errr);
    }
    return;
  };
  
  const license = async (data) => {
    const mutate_data = data.map((i) => {
      return `('${i}')`;
    });
    let query = `insert into teacher_options (license) values`;
    const sql = query + mutate_data.toString();
    const update_data = await use_db(`${sql}`).then((data) => {
      console.log(data);
      if (data.command === "INSERT") {
        return { status: 200, result: "success" };
      } else {
        return { status: 401 };
      }
    });
    return update_data;
  };
  const update_gender = async (req, res) => {
    let data = await req.body;
    try {
      const update = await gender(data);
      res.status(update.status).json(update);
      return;
    } catch (errr) {
      res.status(401).send(errr);
    }
    return;
  };
  
  const gender = async (data) => {
    const mutate_data = data.map((i) => {
      return `('${i}')`;
    });
    let query = `insert into teacher_options (gender) values`;
    const sql = query + mutate_data.toString();
    const update_data = await use_db(`${sql}`).then((data) => {
      console.log(data);
      if (data.command === "INSERT") {
        return { status: 200, result: "success" };
      } else {
        return { status: 401 };
      }
    });
    return update_data;
  };

module.exports = {
  update_marital_status,
  update_teaching_exp,
  update_availibility,
  update_english,
  update_salary_expectations,
  update_age_groups_taught,
  update_subjects,
  update_gender,
  update_qualification,
  update_current_salary,
  update_curriclum,
  update_license
};
